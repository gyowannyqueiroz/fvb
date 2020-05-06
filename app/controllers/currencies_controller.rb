class CurrenciesController < ApplicationController
  def index
    @currencies = Currency.all
  end

  def show
  end

  def new
    @currency = Currency.new
  end

  def edit
    @currency = Currency.find(params[:id])
  end

  def create
    @currency = Currency.create(params.require(:currency).permit(:name))
    if @currency.valid?
      redirect_to currencies_path
    else
      flash[:errors] = @currency.errors.full_messages
      redirect_to new_currency_path
    end
  end

  def update
    @currency = Currency.find(params[:id])
    @currency.update(params.require(:currency).permit(:name))
    redirect_to currencies_path
  end

  def destroy
    @currency = Currency.find(params[:id])
    @currency.destroy
    redirect_to currencies_path
  end
end
