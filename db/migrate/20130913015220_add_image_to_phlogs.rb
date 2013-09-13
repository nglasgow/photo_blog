class AddImageToPhlogs < ActiveRecord::Migration
  def change
    add_column :phlogs, :image, :string
  end
end
