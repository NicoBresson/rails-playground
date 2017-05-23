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
      redirect_to toy_path(@toy)
    else
      render :new_toy
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_toy
    @toy = Toy.find(params[:id])
  end

  def toy_params
    params.require(:toy).permit(:name, :price, :category, :user_id, photos: [])
  end

end
