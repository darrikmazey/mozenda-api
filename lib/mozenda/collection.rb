
module Mozenda
	class Collection < Model

		def views
			return @views if @views
			view_req = Mozenda::CollectionGetViewsRequest.new(self)
			view_res = view_req.send!
			@views = view_res.views
		end

		private

		def class_name
			"Collection"
		end
	end
end

