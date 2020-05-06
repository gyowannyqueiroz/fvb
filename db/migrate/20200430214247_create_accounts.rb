class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.decimal :initial_amount, :default => '0'
      t.references :client
      t.references :currency

      t.timestamps
    end
  end
end
