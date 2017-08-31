class AddIpToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :ip_id, :integer, foreign_key: true
  end
end
