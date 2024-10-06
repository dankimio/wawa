class RoomsController < ApplicationController
  before_action :set_room, only: %i[show join leave]

  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Current.user.rooms.build
  end

  def create
    @room = Current.user.rooms.build(room_params)

    if @room.save
      redirect_to @room
    else
      render :new
    end
  end

  def join
    @room.users << Current.user unless @room.users.include?(Current.user)
    redirect_to @room
  end

  def leave
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
