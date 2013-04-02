
module Mozenda

	class CollectionGetViewsResponse < Response

		def views
			collection_array = @hash[class_name_short]['ViewList']['View']
			collection_array = [collection_array] unless collection_array.class == Array
			@views ||= collection_array.map { |h| View.new(h) }
		end

	end

end
