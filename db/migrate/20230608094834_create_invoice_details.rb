class CreateInvoiceDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :invoice_details do |t|
      t.string :name
      t.timestamps
    end
  end
end
