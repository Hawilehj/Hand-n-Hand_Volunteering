class AddDriversLicenseToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :driverslicense, :string
    add_column :users, :dateofbirth, :date
  end
end
