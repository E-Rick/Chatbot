require_relative "Chatbot"
class AngryChatbot < Chatbot

	def initialize
	end

	def fileName 
		file_name = "chatter_angry.txt"
	end
	#Prints AngryChatbot's nametag
	def printName
		print "Chronos: "
	end	

	#Prints AngryChatbot's greeting
	def greeting
		printName
		puts "Well look who joined the conversation."
	end
	
	#Prints AngryChatbot's goodbye
	def goodbye
		printName
		puts "I've grown tired of you all. Bye!"
	end


end

