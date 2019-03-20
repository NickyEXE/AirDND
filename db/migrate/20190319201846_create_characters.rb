class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :char_class
      t.string :race
      t.integer :level
      t.string :image_url
      t.integer :party_id
      t.timestamps
    end
  end
end
