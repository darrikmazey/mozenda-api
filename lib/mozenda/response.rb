require 'active_support/core_ext/hash'

module Mozenda

	class Response

		def initialize(hash)
			@hash = hash
		end

		def valid?
			class_name_short == @hash.keys.first
		end

		def xml
			@xml
		end

		def hash
			@hash
		end

		def success?
			@hash[@hash.keys.first]['Result'] == 'Success'
		end

		private

		def class_name_short
			self.class.to_s.sub(/^Mozenda::/, '')
		end

	end

end

