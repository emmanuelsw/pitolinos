module ApplicationHelper
	def new_chatroom
		@chatroom ||= Chatroom.new
	end
end
