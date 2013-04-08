
module Mozenda

	class AgentGetListResponse < Response

		def agents
			agent_array = @hash[class_name_short]['AgentList']['Agent']
			agent_array = [agent_array] unless agent_array.class == Array
			@agents ||= agent_array.map { |h| Agent.new(h) }
		end

	end

end
