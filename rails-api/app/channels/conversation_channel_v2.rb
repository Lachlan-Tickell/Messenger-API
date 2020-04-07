class ConversationChannelv2 < ApplicationCable::Channel
    # calls when a client connects to the server
    def subscribed
      if params[:conversation_id].present?
        stream_from("Conversation-#{(params[:conversation_id])}")
      end
    end
    
    # calls when a client broadcasts data
    def speak(data)
      user    = get_user(data)
      conversation_id   = data['conversation_id']
      message   = data['message']
  
      raise 'No conversation_id!' if conversation_id.blank?
      convo = get_convo(conversation_id)
      raise 'No conversation found!' if convo.blank?
      raise 'No message!' if message.blank?
  
      # adds the message user to the conversation if not already included
      convo.users << user unless convo.users.include?(user)
      # saves the message and its data to the DB
      # Note: this does not broadcast to the clients yet!
      Message.create!(
        conversation: convo,
        user: user,
        text: message
      )
    end
    
    # Helpers
    
    def get_convo(conversation_id)
      Conversation.find_by(id: conversation_id)
    end
    
    def set_sender
      User.find_by(id: id)
    end
  end