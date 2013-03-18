require "mozenda/version"
require "mozenda/exception"
require "mozenda/configuration"

module Mozenda
	# Your code goes here...

	def self.configuration(&block)
		mc = Mozenda::Configuration.instance
		yield(mc) if block
		return mc
	end

end
