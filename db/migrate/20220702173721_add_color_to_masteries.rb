class AddColorToMasteries < ActiveRecord::Migration[6.0]
  def change
    add_column :masteries, :color, :integer
  end
end
