class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.boolean :available
      t.timestamp :last_checked_out

      t.timestamps
    end
  end
end
