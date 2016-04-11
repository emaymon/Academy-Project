class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, null: false, unique: true
      t.timestamps
    end
  end
end
