class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title
      t.text :content
      t.integer :hours
      t.string :location
      t.integer :pay

      t.timestamps null: false
    end
  end
end
