class Fixdatetime < ActiveRecord::Migration
  def change
    change_column :pies, :devicetime, :datetime
  end
end
