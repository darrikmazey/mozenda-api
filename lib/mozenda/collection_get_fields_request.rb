module Mozenda
	class CollectionGetFieldsRequest < Request

		def initialize(collection_or_id, opts = {})
			id = collection_or_id
			if collection_or_id.class == Mozenda::Collection
				id = collection_or_id.id
			end
			super("Collection.GetFields", opts.reverse_merge!(:CollectionID => id))
		end

		private

		def required_params
			[:CollectionID]
		end

		def optional_params
			[:Include]
		end

	end
end
