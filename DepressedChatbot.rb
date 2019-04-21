require_relative 'Chatbot'
class DepressedChatbot < Chatbot

	def initialize
	end
	#Prints DepressedChatbot's nametag
	def printName
		print "Han: "
	end	

	def fileName
		file_name = "chatter_sad.txt"
	end
	#Prints DepressedChatbot's greeting
	def greeting
		printName
		puts "My life is horrible, thanks for joining us."
	end

	#Prints DepressedChatbot's goodbye
	def goodbye
		printName
		puts "Thanks for making my day worse. Godspeed."
	end

end




