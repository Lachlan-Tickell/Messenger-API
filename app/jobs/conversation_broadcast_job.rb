class ConversationBroadcastJob < ApplicationJob
    queue_as :default
  
    def perform(conversation)
      conversation.users.each do |user|
        ActionCable.server.broadcast(build_user_id(user.id), conversation)
      end
    end
    
    def build_user_id(id)
      "User-#{id}"
    end
  end