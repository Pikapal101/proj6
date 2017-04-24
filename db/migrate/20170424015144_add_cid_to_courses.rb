class AddCidToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :cid, :string
  end
end
