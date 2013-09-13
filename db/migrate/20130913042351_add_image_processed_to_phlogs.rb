class AddImageProcessedToPhlogs < ActiveRecord::Migration
  def change
    add_column :phlogs, :image_processed, :boolean
  end
end
