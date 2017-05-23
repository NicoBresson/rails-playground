class ToysController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def index
  end

  def show
    set_toy
    @transaction = Transaction.new()
  end

  def new
    @toy = Toy.new
  end

  def create
    @toy = Toy.new(toy_params)
    @toy.user = current_user
    if @toy.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    set_toy
  end

  def update
    set_toy.update(toy_params)
    redirect_to user_path(current_user)
  end

  def destroy
    set_toy.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_toy
    @toy = Toy.find(params[:id])
  end

  def toy_params
    params.require(:toy).permit(:name, :price, :category, :user_id, :description, photos: [])
  end

end
