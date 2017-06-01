class Pet < ApplicationRecord
  validates :breed, :genre, :name, :owner, :phone, 
            :last_consultation, :birthday, presence: :true
  validates :castrated, inclusion: { in: [ true, false ] } 
end
