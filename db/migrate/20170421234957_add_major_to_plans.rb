class AddMajorToPlans < ActiveRecord::Migration[5.0]
  def change
    add_column :plans, :major, :string
  end
end
