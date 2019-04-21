require_relative 'Response'
#Implemented in Chatbot by composition
class ChangeSubjectStrategy < Response
	CHANGE_SUBJECT_INDEX = 12
	def initialize(context)
		@context = context
		length = context.dictionary[CHANGE_SUBJECT_INDEX].length
		@lru_tracker = Array.new(length, 0)
		@lru_tracker[0] = 1
		@index = 1
	end

	
	#Cycles through response
	def respond(savedIndex)
		case @index
		when 1
			@bot_response = @context.dictionary[savedIndex][@index]
			@lru_tracker[@index] = 1
			@index += 1
		when 2
			@bot_response = @context.dictionary[savedIndex][@index]
			@lru_tracker[@index] = 1
			@index += 1
		when 3
			@bot_response = @context.dictionary[savedIndex][@index]
			@lru_tracker[@index] = 1
			@index += 1
		when 4
			@bot_response = @context.dictionary[savedIndex][@index]
			@lru_tracker[@index] = 1
			@index = 1
		end

		@context.printName
		puts @bot_response
	end
	

end
