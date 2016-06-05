class CreateTimers < ActiveRecord::Migration
  def change
    create_table :timers do |t|
      t.integer :user_id
      t.string :token

      t.timestamps null: false
    end
  end
end
