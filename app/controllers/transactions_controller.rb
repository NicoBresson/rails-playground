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
    @transaction.validated = params[:transaction][:validated]
    @transaction.save
    redirect_to user_path(current_user)
  end

  def bagarre
    @user = current_user
    user_transactions = @user.transactions
    late_transactions = []
    user_transactions.each do |transaction|
      late_transactions << transaction if transaction.end_time < DateTime.now
  end

  private

  def transaction_params
    params.require(:transaction).permit(:start_time, :end_time)
  end
end
