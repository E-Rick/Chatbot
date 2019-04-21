require_relative 'Response'
#Implemented in Chatbot by composition
class QuestionStrategy < Response

	#Cycles between two deflection phrases given a response.
	#Counters are used to keep track of deflections
	def initialize(context)
		@context = context
		@happy_deflection = 0
		@depressed_deflection = 0
		@angry_deflection = 0
	end
	
	#Reponds with a deflection and cycles through two responses 
	def respond(savedIndex)
		@context.printName

		if @context.is_a? HappyChatbot
			if @happy_deflection == 0
				puts "I'd love to answer that for you, but what do you think about that?"
				@happy_deflection += 1
			elsif @happy_deflection == 1
				puts "What was that?"
				@happy_deflection = 0
			end
		elsif @context.is_a? DepressedChatbot
			if @depressed_deflection == 0
				puts "It hurts me to answer a question you already know the answer to."
				@depressed_deflection += 1
			elsif @depressed_deflection == 1
				puts "Why ask me, man? I don't know the answer, but I can bet that you do though."
				@depressed_deflection = 0
			end
		elsif @context.is_a? AngryChatbot
			if @angry_deflection == 0
				puts "I don't know, why don't you tell me!"
				@angry_deflection += 1
			elsif @angry_deflection == 1
				puts "I bet you know the answer to that yourself, don't you?"
				@angry_deflection = 0
			end
		end
	end
end
