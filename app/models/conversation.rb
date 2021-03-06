class Conversation < ApplicationRecord
    has_many :messages
    has_and_belongs_to_many :users

    after_create_commit { ConversationBroadcastJob.perform_later(self) }
end
