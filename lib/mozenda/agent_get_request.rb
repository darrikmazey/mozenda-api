module Mozenda
	class AgentGetRequest < Request

		def initialize(agent_or_id, opts = {})
			id = agent_or_id
			if agent_or_id.class == Mozenda::Agent
				id = agent_or_id.id
			end
			super("Agent.Get", opts.reverse_merge!(:AgentId => id))
		end

		private

		def required_params
			[ :AgentId ]
		end
	end
end
