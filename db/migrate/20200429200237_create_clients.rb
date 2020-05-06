class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :age
      t.boolean :parent, :default => false
      t.references :parent_client, index: true

      t.timestamps
    end
  end
end
