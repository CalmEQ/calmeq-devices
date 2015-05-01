class CreatePies < ActiveRecord::Migration
  def change
    create_table :pies do |t|
      t.string :identifier
      t.text :notes

      t.timestamps
    end
  end
end
