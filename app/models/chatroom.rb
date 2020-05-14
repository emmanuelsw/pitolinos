class Chatroom < ApplicationRecord
	has_many :chatroom_users
	has_many :users, through: :chatroom_users
	has_many :messages

	validates :name, presence: true

	before_create :capitalize_username

	def ordered_messages
		messages.includes(:user).order(created_at: :asc).limit(100)
	end

	private
	def capitalize_username
		name.capitalize!
	end
end
