module ApplicationHelper
	def new_chatroom
		@chatroom ||= Chatroom.new
	end

	def users
		@users = User.where.not(id: current_user.id)
	end
end
