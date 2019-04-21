require_relative 'Chatbot'
class HappyChatbot < Chatbot

	#Implements initialize and reads in HappyChatbot's response dictionary
	def initialize
	end
	#Prints HappyChatbot's nametag
	def printName
		print "Amina: "
	end	
	def fileName
		file_name = "chatter_happy.txt"
	end
	#Prints HappyChatbot greeting
	def greeting
		printName
		puts "How nice of you to join us!"
	end
	
	#Prints HappyChatbot's goodbye
	def goodbye
		printName
		puts "Pleasure speaking with you guys. Bye!"
	end

end

