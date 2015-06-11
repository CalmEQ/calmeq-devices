class AddIdentifierToReadings < ActiveRecord::Migration
  def change
    add_column :readings, :identifier, :string
  end
end
