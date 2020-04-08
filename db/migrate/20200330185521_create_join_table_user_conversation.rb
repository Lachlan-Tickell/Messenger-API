class CreateJoinTableUserConversation < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations_users, id: false do |t|
      t.references :conversation, index: true, null: false, foreign_key: true
      t.references :user, index: true, null: false, foreign_key: true
      t.index [:conversation_id, :user_id], :unique => true
    end
  end
end
