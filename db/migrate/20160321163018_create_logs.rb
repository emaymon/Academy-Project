class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :admin_user_id
      t.integer :activity_type_id
      t.string :app_key, null: false
      t.timestamps
    end
    add_foreign_key(:logs, :admin_users)
    add_foreign_key(:logs, :activity_types)
  end
end
