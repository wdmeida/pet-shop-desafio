class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :breed
      t.string :genre
      t.boolean :castrated
      t.date :birthday
      t.string :name
      t.date :last_consultation

      t.timestamps
    end
  end
end
