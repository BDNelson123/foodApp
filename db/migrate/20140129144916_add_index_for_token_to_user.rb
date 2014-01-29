class AddIndexForTokenToUser < ActiveRecord::Migration
  def up
    if column_exists? :users, :token_authenticatable
      add_index :users, :token_authenticatable, :unique => true
    end
  end

  def down
    remove_index :users, :token_authenticatable, :unique => true
  end
end
