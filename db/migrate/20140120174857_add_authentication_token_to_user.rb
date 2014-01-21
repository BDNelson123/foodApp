class AddAuthenticationTokenToUser < ActiveRecord::Migration
  def up
    unless column_exists? :users, :token_authenticatable
      add_column :users, :token_authenticatable, :string
    end
  end

  def down
    if column_exists? :users, :token_authenticatable
      remove_column :users, :token_authenticatable
    end
  end
end
