class ChangeDataTypeForFieldname < ActiveRecord::Migration[5.0]
  def change
    change_column(:jobs, :text, :text)
  end
end