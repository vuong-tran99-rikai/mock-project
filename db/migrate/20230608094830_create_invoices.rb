class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :quantity, default: 1
      t.timestamps
  end
end
end
