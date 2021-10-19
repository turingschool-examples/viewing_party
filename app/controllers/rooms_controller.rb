class RoomsController < ApplicationController
  before_action :load_entities

  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(permitted_params)
    if @room.save
      flash[:success] = "Room #{@room.name} was created successfully."
      redirect_to rooms_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update_attributes(permitted_params)
      flash[:success] = "Room #{@room.name} was updated successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end

  def show
    @room_message = RoomMessage.new(room: @room)
    @room_messages = @room.room_messages.includes(:user)
  end

  def destroy
    @room.destroy

    redirect_to rooms_path
    flash[:success] = "#{@room.name} has been deleted."
  end


  private

  def load_entities
    @rooms = Room.all
    @room = Room.find(params[:id]) if params[:id]
  end

  def permitted_params
    params.require(:room).permit(:name)
  end
end
