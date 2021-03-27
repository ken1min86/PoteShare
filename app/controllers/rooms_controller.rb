class RoomsController < ApplicationController
  before_action :set_q
  before_action :login_required, only: %i[new create posts]

  def index; end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new
    params[:room]['user_id'] = current_user.id
    @room.assign_attributes(room_params)
    if @room.save
      flash.notice = 'Room was successfully created.'
      redirect_to reserve_room_path(@room.id)
    else
      render :new
    end
  end

  def reserve
    @room = Room.find_by(id: params[:id])
    @user = @room.user
    @reservation = Reservation.new
  end

  def posts
    @rooms = current_user.rooms
  end

  def search
    @rooms = @q.result
  end

  private

  def room_params
    params.require(:room).permit(:roomname, :introduction, :fee, :room_img, :address, :user_id)
  end
end
