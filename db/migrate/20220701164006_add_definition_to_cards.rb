class AddDefinitionToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :definition, :text
  end
end
