
require 'active_support/core_ext/numeric'

module Mozenda
	class Configuration
		@@instance = nil
		@@required_options = [ :web_service_key ]
		@@optional_options = [ :base_uri, :service, :rate_limit ]

		@@default_options = {
			:base_uri => "https://api.mozenda.com/rest",
			:service => 'Mozenda10',
			:rate_limit => 28.to_f / 1.minute.to_f,
		}

		(@@required_options + @@optional_options).each do |option|
			define_method("#{option}=".to_sym) do |option_value|
				@options[option.to_sym] = option_value
			end
			define_method("#{option}".to_sym) do
				if @@required_options.include?(option.to_sym) and @options[option.to_sym].nil?
					raise Mozenda::ConfigurationException.new("missing required option: #{option}")
				end
				@options[option.to_sym]
			end
		end

		def self.instance
			@@instance ||= self.new
		end

		def initialize
			@options = @@default_options.dup
		end

		def options
			@options
		end

	end
end

