class AddAliveToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :alive, :boolean
  end
end
