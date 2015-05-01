class Addinfo2py < ActiveRecord::Migration
  def change
    add_column :pies, :lat, :double
    add_column :pies, :lon, :double
    add_column :pies, :dblvl, :double
    add_column :pies, :devicetime, :double 
  end
end
