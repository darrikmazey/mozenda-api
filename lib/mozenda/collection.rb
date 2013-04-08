
module Mozenda
	class Collection < Model

		def views
			return @views if @views
			view_req = Mozenda::CollectionGetViewsRequest.new(self)
			view_res = view_req.send!
			@views = view_res.views
		end

		def fields
			return @fields if @fields
			field_req = Mozenda::CollectionGetFieldsRequest.new(self)
			field_res = field_req.send!
			@fields = field_res.fields
		end

		private

		def class_name
			"Collection"
		end
	end
end

