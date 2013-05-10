module Mozenda
	class ViewGetItemsRequest < Request

		def initialize(view_or_id, opts = {})
			id = view_or_id
			if view_or_id.class == Mozenda::View
				id = view_or_id.id
			end
			super("View.GetItems", opts.reverse_merge!(:ViewID => id))
		end

		private

		def required_params
			[ :ViewID ]
		end

		def optional_params
			[ :PageItemCount, :PageNumber ]
		end

	end
end
