require "active_support/core_ext/hash"
require 'open-uri'

module Mozenda
	class Request

		def initialize(operation, opts = {})
			@operation = operation
			@options = opts.reverse_merge!({})
			@sent = false
			@response_xml = nil
			@response_hash = nil
			@response_object = nil
		end

		def to_params
			["Operation=#{@operation}", @options.select { |k,v| required_params.include?(k) || optional_params.include?(k) }.map { |k,v| "#{k}=#{v}" }.join('&')].delete_if { |v| v.empty? }.join('&')
		end

		def valid?
			(required_params - @options.keys).empty?
		end

		def errors
			missing_req_params = (@@required_params - @options.keys)
			"Required parameters missing: #{missing_req_params}"
		end

		def send!
			if !valid?
				raise Mozenda::InvalidRequestException.new(errors)
			end

			unless sent?
				delay = Mozenda::RateLimit.delay
				sleep(delay) if delay > 0
				@response_xml = open(full_uri).read
				Mozenda::RateLimit << self
				@sent = true
				@response_object = generate_response
			end
			@response_object
		end

		def response_xml
			@response_xml
		end

		def response_hash
			@response_hash
		end

		def response_object
			@response_object
		end

		def sent?
			@sent
		end

		#private

		def generate_response
			@response_hash = Hash.from_xml(@response_xml)
			begin
				klass = "Mozenda::#{@response_hash.keys.first}".constantize
			rescue NameError => e
				raise ResponseTypeException.new("missing Response type: Mozenda::#{@response_hash.keys.first}")
			end
			if klass
				return klass.new(@response_hash)
			else
				return nil
			end
		end

		def base_uri
			"#{Mozenda.configuration.base_uri}?WebServiceKey=#{Mozenda.configuration.web_service_key}&Service=#{Mozenda.configuration.service}"
		end

		def full_uri
			"#{base_uri}&#{to_params}"
		end

		def required_params
			[]
		end

		def optional_params
			[]
		end
	end
end

