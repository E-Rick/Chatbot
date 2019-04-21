require_relative 'Response'
#Implemented in Chatbot by composition
class MatchStrategy < Response

	def initialize(context)
		@context = context
		@lru_tracker = Array.new(@context.dictionary.length) 

		#Create 2D array clone of keywords with 0-1 flags to check LRU
		@context.dictionary.each_index do |i|
			@lru_tracker[i] = Array.new(@context.dictionary[i].length,0)
			@lru_tracker[i][0] += 1
			i += 1
		end
	end


	def respond(savedIndex)
		#Checks if all responses have been used to reset them
		if @lru_tracker[savedIndex].uniq.length == 1
			puts "all responses used, time to reset"
			@lru_tracker[savedIndex] = Array.new(@context.dictionary[savedIndex].length,0)
			@lru_tracker[savedIndex][0] += 1
		end
		
		@lru_tracker[savedIndex].each_index do |i|
			#If first response not chosen yet
			if @lru_tracker[savedIndex][1] == 0
				@bot_response = @context.dictionary[savedIndex][1]
				@lru_tracker[savedIndex][1] += 1
				break
			#If respone not chosen yet
			elsif @lru_tracker[savedIndex][i] == 0
				@bot_response = @context.dictionary[savedIndex][i]
				@lru_tracker[savedIndex][i] += 1
				break
			end
		end

		#Print bot response
		@context.printName
		puts @bot_response
	end
end
