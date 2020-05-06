class CreateAccountTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :account_transactions do |t|
      t.datetime :date
      t.decimal :amount, precision: 20, scale: 2
      t.string :description
      t.references :account
      t.decimal :balance, precision: 20, scale: 2

      t.timestamps
    end
  end
end
