require "mozenda/version"
require "mozenda/exception"
require "mozenda/configuration"

module Mozenda
	# Your code goes here...
	BASE_URI="https://api.mozenda.com/rest"

	def self.configuration(&block)
		mc = Mozenda::Configuration.instance
		yield(mc) if block
		return mc
	end

end
