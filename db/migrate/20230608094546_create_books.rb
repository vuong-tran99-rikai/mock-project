class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :desciption
      t.string :author
      t.integer :quantity
      t.bigserial :category_id
      t.integer :status
      t.timestamps
    end
  end
end
