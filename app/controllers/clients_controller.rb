class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.create(permitted_params)
    if @client.valid?
      redirect_to clients_path
    else
      flash[:errors] = @client.errors.full_messages
      redirect_to new_client_path
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    @client.update(permitted_params)
    redirect_to clients_path
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_path
  end

  private

  def permitted_params
    params.require(:client).permit(:name, :age, :parent, :parent_client_id)
  end
end
