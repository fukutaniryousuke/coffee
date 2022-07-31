class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :introduction
      t.integer :ganre_id
      t.integer :price
      t.boolean :is_active, default:true

      t.timestamps
    end
  end
end
