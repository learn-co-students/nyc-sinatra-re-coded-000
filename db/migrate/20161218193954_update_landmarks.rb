class UpdateLandmarks < ActiveRecord::Migration
  def change
    remove_column :landmarks,:names
    add_column :landmarks,:name, :string
  end
end
