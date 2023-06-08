class CreateDiscountDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :discount_details do |t|

      t.timestamps
    end
  end
end
