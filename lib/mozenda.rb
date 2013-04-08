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

	def self.agents
		request = Mozenda::AgentGetListRequest.new
		response = request.send!
		response.agents
	end

	def self.views_for_collection(collection_id)
		request = Mozenda::CollectionGetViewsRequest.new(collection_id)
		response = request.send!
		response.views
	end
end
