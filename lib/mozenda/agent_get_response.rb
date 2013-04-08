
module Mozenda

	class AgentGetResponse < Response

		def agent_id
			@hash[class_name_short]["AgentID"].to_i
		end

		def collection_id
			@hash[class_name_short]["CollectionID"].to_i
		end

		def description
			@hash[class_name_short]["Description"]
		end

		def domain
			@hash[class_name_short]["Domain"]
		end

	end

end
