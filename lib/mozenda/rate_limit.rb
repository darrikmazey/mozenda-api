require 'active_support/core_ext/numeric'

module Mozenda
	class RateLimit
		
		def self.instance
			@instance ||= self.new
			@instance
		end

		def initialize
			@ary = []
			@max_ary_size = 100
			@total = 0
		end

		def self.current_rate
			self.instance.current_rate
		end

		def current_rate
			return 0 if @ary.count <= 1
			@ary.count / (Time.now - @ary.first)
		end

		def self.<<(req)
			self.instance << req
		end

		def <<(req)
			@ary << Time.now
			@total += 1
			if @ary.count > @max_ary_size
				@ary.shift
			end
		end

		def self.delay
			self.instance.delay
		end

		def delay
			if @ary.count < 5 || (Time.now - @ary.first) < 6
				return 0
			end
			delay = self.current_rate / Mozenda.configuration.rate_limit - 0.9
			real_delay = [0, delay].max * 20
			real_delay.round(2)
		end
		
		def self.total_reqs_sent
			self.instance.total_reqs_sent
		end

		def total_reqs_sent
			@total
		end

		def self.stats
			[ self.current_rate, self.delay, self.total_reqs_sent ]
		end

	end
end

