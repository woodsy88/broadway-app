class PlaysController < ApplicationController
  before_action :set_play, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :delete]
  
  def index
    @plays = Play.all.order("created_at DESC")
  end

  def new
    @play = Play.new
  end

  def create
    @play = Play.new(play_params)
    @play.user_id = current_user.id

    if @play.save
      redirect_to @play
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @play.update(play_params)
      redirect_to @play
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @play.destroy
    redirect_to plays_path
  end

  private

  def play_params
    params.require(:play).permit(:title, :description, :director)
  end

  def set_play
    @play = Play.find(params[:id])
  end  


end
