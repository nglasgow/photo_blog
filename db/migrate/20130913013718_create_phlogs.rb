class CreatePhlogs < ActiveRecord::Migration
  def change
    create_table :phlogs do |t|
      t.string :name

      t.timestamps
    end
  end
end
