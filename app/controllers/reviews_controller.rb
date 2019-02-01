class ReviewsController < ApplicationController
  before_action :set_play, only: [:new, :create, :edit, :destroy, :update]
  before_action :set_review, only: [:edit, :update, :destroy]

  before_action :authenticate_user!, only: [ :new, :edit ]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.play_id = @play.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to play_path(@play), notice: "your review has been posted"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to play_path(@play), notice: "your review was edited"
    else
      render 'edit'
    end
  end


  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to plays_url, notice: 'Review was successfully destroyed.' }
    end    
  end


private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def set_play
    @play = Play.find(params[:play_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
