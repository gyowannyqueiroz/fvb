class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def edit
    @account = Account.find(params[:id])
  end

  def create
    @account = Account.create(permitted_params)
    if @account.valid?
      redirect_to accounts_path
    else
      flash[:errors] = @account.errors.full_messages
      redirect_to new_account_path
    end
  end

  def update
    @account = Account.find(params[:id])
    if @account.initial_amount != permitted_params[:initial_amount] && AccountTransaction.where(account_id: @account.id).count > 0
      flash[:errors] = "Can't update initial balance because there are transactions for this account"
      redirect_to edit_account_path
    else
      @account.update(permitted_params)
      redirect_to accounts_path
    end
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to accounts_path
  end

  private

  def permitted_params
    params.require(:account).permit(:initial_amount, :client_id, :currency_id)
  end
end
