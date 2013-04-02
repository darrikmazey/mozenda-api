require "mozenda/version"
require "mozenda/exception"
require "mozenda/configuration"
require "mozenda/request"
require "mozenda/requests"
require "mozenda/response"
require "mozenda/responses"
require "mozenda/model"
require "mozenda/models"

module Mozenda
	# Your code goes here...

	def self.configuration(&block)
		mc = Mozenda::Configuration.instance
		yield(mc) if block
		return mc
	end

	def self.collections
		request = Mozenda::CollectionGetListRequest.new
		response = request.send!
		response.collections
	end

end
