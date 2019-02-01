class PlaysController < ApplicationController
  before_action :set_play, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :delete]
  
  def index
    if params[:category].blank?
      @plays = Play.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @plays = Play.where(:category_id => @category_id)
    end
  end

  def new
    @play = Play.new
    @categories = Category.all.map{ |category| [ category.name, category.id ] }
  end

  def create
    @play = Play.new(play_params)
    @play.user_id = current_user.id

    @play.category_id = params[:category_id]

    if @play.save
      redirect_to @play, notice: "your play has been created"
    else
      render 'new'
    end
  end

  def edit
    authorize @play
    @categories = Category.all.map{ |category| [ category.name, category.id ] }
  end

  def update
    authorize @play

    @play.category_id = params[:category_id]

    if @play.update(play_params)
      redirect_to @play, notice: "your play has been updated"
    else
      render 'edit'
    end
  end

  def show
    if @play.reviews.blank?
      @average_review = 0
    else
      @average_review = @play.reviews.average(:rating).round(2)
    end
  end

  def destroy
    authorize @play
    @play.destroy
    redirect_to plays_path
  end

  private

  def play_params
    params.require(:play).permit(:title, :description, :director, :category_id, :play_img)
  end

  def set_play
    @play = Play.find(params[:id])
  end  


end
