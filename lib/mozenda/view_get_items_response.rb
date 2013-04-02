
module Mozenda

	class ViewGetItemsResponse < Response

		def items
			item_array = @hash[class_name_short]['ItemList']['Item']
			item_array = [item_array] unless item_array.class == Array
			@items ||= item_array.map { |h| Item.new(h) }
		end
		
		def page_number
			return @hash[class_name_short]['PageNumber'].to_i
		end

		def page_count
			return @hash[class_name_short]['PageCount'].to_i
		end

	end

end
