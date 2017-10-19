class MessagesController < ApplicationController

	before_action :set_chatroom

	def create
		message = @chatroom.messages.new(message_params)
		message.user = current_user
		message.save
		MessageRelayJob.perform_later(message, current_user)
	end

	def self.custom_render(user, *args)
		ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
		proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(user, scope: :user) }
		renderer = self.renderer.new('warden' => proxy)
		renderer.render(*args)
	end

	private
	def set_chatroom
		@chatroom = Chatroom.find(params[:chatroom_id])
	end

	def message_params
		params.require(:message).permit(:body)
	end

end
