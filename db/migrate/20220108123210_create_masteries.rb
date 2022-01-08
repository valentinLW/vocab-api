class CreateMasteries < ActiveRecord::Migration[6.0]
  def change
    create_table :masteries do |t|
      t.references :user, null: false, foreign_key: true
      t.string :from
      t.string :to
      t.string :audio
      t.integer :repetitions
      t.integer :interval
      t.float :ease

      t.timestamps
    end
  end
end
