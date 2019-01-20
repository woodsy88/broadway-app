class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :delete]

  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def create
     @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: "your category has been created"
    else
      render 'new'
    end     
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end  

end
