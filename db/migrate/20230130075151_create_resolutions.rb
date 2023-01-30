class CreateResolutions < ActiveRecord::Migration[7.0]
  def change
    create_table :resolutions do |t|
      t.string :gym
      t.string :fruit
      t.string :coaching
      t.string :program

      t.timestamps
    end
  end
end
