class AddRememberDigestToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :remember_digest, :string
  end
end
