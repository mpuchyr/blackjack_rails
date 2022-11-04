class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :high_value
      t.integer :low_value
      t.string :suit
      t.string :image
    end
  end
end
