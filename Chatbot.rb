require_relative 'MatchStrategy'
require_relative 'QuestionStrategy'
require_relative 'ChangeSubjectStrategy'
class Chatbot
	CHANGE_SUBJECT_INDEX = 12
	attr_reader :user, :dictionary, :response
		
	def initialize
		raise NoMethodError
	end
	
	#Initializes strategies in subclass chatbots
	def startStrategies
		@match_strategy = MatchStrategy.new(self)
		@change_strategy = ChangeSubjectStrategy.new(self)
		@question_strategy = QuestionStrategy.new(self)
	end

	#Return username
	def username 
		@user.username
	end
	
	
	#Template Method for entering chat
	def enterChat(user)
		@user = user
		@user.add_observer(self)
		readFile
		greeting 
	end
	
	#Reads in bot dictionarys and converts to an 2D array
	def readFile
		file = File.open(fileName, "r")

		#Array for partial matches		
		@dictionary = Array.new
		file.each do |line|
			if line != "\n"
				@dictionary << line.split(/[:;\n]/)
			end
		end
		startStrategies
	end

	#Calculates how bots should respond given a 
	#Check for match
	#Check for ?, changesubject, or no match. 
	def update(response)	
		@response = response	
		matched = false
		saved_index = 0

		#Check for partial match
		@dictionary.each_index do |i|
			if response.include? @dictionary[i][0] and response.include? "?"
				saved_index = i
				matched = true
			end
		end
		#No partial match found, now check for a "?", no match, or one word response		
		if matched
			@match_strategy.respond(saved_index)
		else
			if response.include? "?"
				@question_strategy.respond(saved_index)		
			elsif response.split(/\s+/).length == 1
				goodbye
				@user.delete_observer(self)
			else
				@change_strategy.respond(CHANGED_SUBJECT_INDEX)
			end
		end
	end

	#Prints bot's name for fluent chat
	def printName
		raise NoMethodError
	end	

	#Returns bot's dictionary file name
	def fileName
		raise NoMethodError
	end

	#Prints the bot's specific greeting
	def greeting
		raise NoMethodError
	end
	
	#Prints the bot's specific goodbye`
	def goodbye
		raise NoMethodError
	end
	
	
end
	

	



