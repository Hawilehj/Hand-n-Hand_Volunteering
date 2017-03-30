class RemovePasswordFromOrganization < ActiveRecord::Migration[5.0]
  def change
    remove_column :organizations, :password, :string
  end
end
