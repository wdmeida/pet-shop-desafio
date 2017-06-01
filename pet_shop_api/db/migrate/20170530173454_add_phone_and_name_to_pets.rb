class AddPhoneAndNameToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :owner, :string
    add_column :pets, :phone, :string
  end
end
