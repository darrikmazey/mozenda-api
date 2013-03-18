
module Mozenda
	class Configuration
		@@instance = nil

		%w{web_service_key}.each do |option|
			define_method("#{option}=".to_sym) do |option_value|
				@options[option.to_sym] = option_value
			end
			define_method("#{option}".to_sym) do
				@options[option.to_sym]
			end
		end

		def self.instance
			@@instance ||= self.new
		end

		def initialize
			@options = Hash.new
		end

		def options
			@options
		end

	end
end

