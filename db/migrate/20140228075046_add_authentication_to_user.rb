class AddAuthenticationToUser < ActiveRecord::Migration
  def change
    add_column :authentications, :user_id, :integer
  end
end
