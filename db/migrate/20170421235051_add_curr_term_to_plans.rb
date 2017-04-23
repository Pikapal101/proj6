class AddCurrTermToPlans < ActiveRecord::Migration[5.0]
  def change
    add_column :plans, :currTerm, :string
  end
end
