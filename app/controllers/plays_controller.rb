class PlaysController < ApplicationController
  def index
    @plays = Play.all
  end

  def new
    @play = Play.new
  end

  def create
    @play = Play.new(play_params)
  end

  def edit
  end

  def show
  end

  def _form
  end

  private

  def play_params
    params.require(:play).permit(:title, :description, :director)
  end

  
end
