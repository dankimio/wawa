class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Current.user.rooms.build
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to @room
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
