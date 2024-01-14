class AddRememberDigestToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :remember_digest, :string
  end
end
 #def change
  # add_column :users, :remember_digest, :string unless column_exists?(:users, :remember_digest)
# end
#end 