class AddUserIdToResolutions < ActiveRecord::Migration[7.0]
  def change
    add_reference :resolutions, :user, foreign_key: true
  end
end
