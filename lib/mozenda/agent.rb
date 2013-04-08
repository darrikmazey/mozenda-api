
module Mozenda
	class Agent < Model

		def get
			request = Mozenda::AgentGetRequest.new(self)
			@get_response = request.send!
			@get_response
		end

		def views_for_collection
			if @get_response.nil?
				get
			end
			unless @get_response.success? and @get_response.collection_id
				return []
			end
			return Mozenda.views_for_collection(@get_response.collection_id)
		end

		private

		def class_name
			"Agent"
		end
	end
end

