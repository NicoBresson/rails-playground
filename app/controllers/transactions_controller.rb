class TransactionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = current_user
    @toy = Toy.find(params[:toy_id])
    @transaction = Transaction.new(transaction_params)
    @transaction.user_id = @user.id
    @transaction.toy_id = @toy.id
    if @transaction.save
      redirect_to school_path(@toy.user.school)
    else
      render toy_path(params[:toy_id])
    end
  end

  def update
    @transaction = Transaction.find(params[:id])
    @transaction.rating = params[:transaction][:rating]
    @transaction.validated = params[:transaction][:validated]
    @transaction.save
    redirect_to user_path(current_user)
  end
  private

  def transaction_params
    params.require(:transaction).permit(:start_time, :end_time)
  end
end
