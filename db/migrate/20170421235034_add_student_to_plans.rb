class AddStudentToPlans < ActiveRecord::Migration[5.0]
  def change
    add_column :plans, :student, :string
  end
end
