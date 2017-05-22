class ToysController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def index
  end

  def show
    set_toy
    @transaction = Transaction.new()
  end

  def new
  end

  def create
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
    params.require(:toy).permit(:name, :price, :category, :user_id)
  end

end
