class Chatroom < ApplicationRecord
	has_many :chatroom_users
	has_many :users, through: :chatroom_users
	has_many :messages

	before_create :capitalize_username

	private
	def capitalize_username
		name.capitalize!
	end
end
