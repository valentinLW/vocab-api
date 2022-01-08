class AddNextTestToMastery < ActiveRecord::Migration[6.0]
  def change
    add_column :masteries, :next_test, :timestamp, default: DateTime.now
  end
end
