class AddDateToResolution < ActiveRecord::Migration[7.0]
  def change
    add_column :resolutions, :date, :datetime
    add_column :resolutions, :green_tea, :string
    add_column :resolutions, :words, :string
    add_column :resolutions, :project, :string
    add_column :resolutions, :speaking, :string
    add_column :resolutions, :no_junk_food, :string
  end
end
