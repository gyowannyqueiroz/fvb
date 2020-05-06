module ApplicationHelper
  def show_hide(show)
    show ? 'block' : 'none'
  end

  def account_balance(account_id)
    last_transaction = AccountTransaction.where(account_id: account_id).order("created_at DESC").first
    last_transaction ? last_transaction.balance : 0.0
  end
end
