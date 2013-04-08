
module Mozenda

	class CollectionGetFieldsResponse < Response

		def fields
			field_array = @hash[class_name_short]['FieldList']['Field']
			field_array = [field_array] unless field_array.class == Array
			@fields ||= field_array.map { |h| Field.new(h) }
		end

	end

end
