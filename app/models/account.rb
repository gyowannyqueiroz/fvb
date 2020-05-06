class Account < ApplicationRecord
  belongs_to :client
  belongs_to :currency

  def client_name
    self.client.name
  end

  def currency_name
    self.currency.name
  end

  def account_name
    "#{client_name} - #{self.id} - #{currency_name}"
  end

  def current_balance
    AccountTransaction.last_transaction
  end
end
