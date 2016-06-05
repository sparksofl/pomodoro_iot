class AddEstimateToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :estimate, :integer
  end
end
