class AddDefaultValueToAvailableAttribute < ActiveRecord::Migration[5.1]

  def up
    change_column :books, :available, :boolean, default: true
  end

  def down
    change_column :books, :available, :boolean, default: true
  end
end
