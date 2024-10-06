class MessagesController < ApplicationController
  before_action :set_room

  def create
    message = @room.messages.build(message_params.merge(user: Current.user))
    message.save!
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
