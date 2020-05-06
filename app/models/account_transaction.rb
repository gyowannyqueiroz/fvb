class AccountTransaction < ApplicationRecord
  belongs_to :account
  validates :date, :description, :account, presence: true
  validates :amount, presence: true, numericality: { other_than: 0 }

  before_create :update_balance

  def last_transaction
    AccountTransaction.where(self.account_id).order("created_at DESC").first
  end

  private

  def update_balance
    current_balance = last_transaction ? last_transaction.balance : self.account.initial_amount
    self.balance = current_balance + self.amount
    puts "Current balance: #{current_balance} / Transaction amount: #{self.amount} / Updated balance: #{self.balance}"
  end
end
