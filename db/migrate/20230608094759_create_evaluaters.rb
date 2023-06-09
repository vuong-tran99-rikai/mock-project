class CreateEvaluaters < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluaters do |t|
      t.string :name
      t.timestamps
    end
  end
end
