class AdminFlagToAuthors < ActiveRecord::Migration
  def up
    add_column :authors, :admin, :boolean
  end

  def down
    remove_column :authors, :admin
  end
end
