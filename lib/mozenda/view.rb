
module Mozenda
	class View < Model

		def items
			return @items if @items
			@items = []
			page_num = 0
			page_count = 1
			while (page_num != page_count)
				item_req = Mozenda::ViewGetItemsRequest.new(self)
				item_res = item_req.send!
				page_num = item_res.page_number
				page_count = item_res.page_count
				@items += item_res.items
			end
			@items
		end

		private
	
		def class_name
			"View"
		end

	end
end

