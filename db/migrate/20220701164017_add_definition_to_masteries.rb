class AddDefinitionToMasteries < ActiveRecord::Migration[6.0]
  def change
    add_column :masteries, :definition, :text
  end
end
