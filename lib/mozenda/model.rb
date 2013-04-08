
module Mozenda

	class Model

		def initialize(fields = {})
			@data = {}
			fields.each do |k,v|
				@data[k] = (k =~ /ID$/ ? v.to_i : v)
				define_singleton_method(k.underscore.to_sym) do
					@data[k]
				end
				unless k == "#{class_name}ID"
					define_singleton_method("#{k.underscore}=".to_sym) do |option_value|
						@data[k] = option_value
					end
				end
				define_singleton_method(:id) do
					@data["#{class_name}ID"]
				end
			end
		end

		def data
			@data
		end

		private

		def class_name
			"Model"
		end
	end

end
