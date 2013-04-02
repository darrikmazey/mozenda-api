
module Mozenda

	class CollectionGetListResponse < Response

		def collections
			collection_array = @hash[class_name_short]['CollectionList']['Collection']
			collection_array = [collection_array] unless collection_array.class == Array
			@collections ||= collection_array.map { |h| Collection.new(h) }
		end

	end

end
