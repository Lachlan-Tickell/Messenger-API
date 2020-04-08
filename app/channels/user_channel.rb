class UserChannel < ApplicationCable::Channel
  def subscribed
    if params[:user_id].present?
      stream_from("User-#{(params[:user_id])}")
    end
  end

  def unsubscribed
  end
end