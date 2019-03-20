class AddBioToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :bio, :string
  end
end
