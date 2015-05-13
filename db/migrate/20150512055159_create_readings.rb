class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.references :py, index: true
      t.float :dblvl
      t.float :lat
      t.float :lon
      t.datetime :devicetime

      t.timestamps
    end
  end
end
