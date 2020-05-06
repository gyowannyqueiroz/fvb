class AccountTransactionsController < ApplicationController
  def index
    @account_transactions = AccountTransaction.order(created_at: :desc)
  end

  def new
    @account_transaction = AccountTransaction.new(date: Time.now)
  end

  def create
    @account_transaction = AccountTransaction.create(permitted_params)
    if @account_transaction.valid?
      redirect_to account_transactions_path
    else
      flash[:errors] = @account_transaction.errors.full_messages
      redirect_to new_account_transactions_path
    end
  end

  def edit
    @account_transaction = AccountTransaction.find(params[:id])
  end

  def update
    @account_transaction = AccountTransaction.find(params[:id])
    @account_transaction.updated(permitted_params)
    redirect_to account_transactions_path
  end

  def destroy
    @account_transaction = AccountTransaction.find(params[:id])
    @account_transaction.destroy
    redirect_to account_transactions_path
  end

  def client_name
    self.client.name
  end

  private

  def permitted_params
    params.require(:account_transaction).permit(:date, :amount, :description, :account_id)
  end
end
