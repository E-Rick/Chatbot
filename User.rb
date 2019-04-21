require "observer" 
class User

#contains your user class
#This is your subject in your Observer pattern and should include the observable module

#Create a User class with an Observable module to represent the user’s current state.
#Whenever the user enters a response, it should trigger an event that notifies that chatbots.
	attr_reader :username

	include Observable

	def initialize(name)
		@username = name
	end

#The user will enter a chat string
#The user will then notify all observers that a chat string is waiting
#The chatbots will decide how to continue conversation based on the contents of the chat string
#If the conversation continues, the bot will choose an appropriate response strategy
#otherwise, end the conversation and say a unique goodbye. 

	def converse
		print "#{@username}: "
		response = gets.chomp.downcase
		changed
		notify_observers(response)
	end
	



end
