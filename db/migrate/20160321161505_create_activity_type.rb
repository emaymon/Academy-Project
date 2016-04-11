class CreateActivityType < ActiveRecord::Migration
  def change
    create_table :activity_types do |t|
      t.string :name, null: false, unique: true
      t.timestamps
    end
  end
end
