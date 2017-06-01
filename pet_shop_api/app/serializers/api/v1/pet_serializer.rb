class Api::V1::PetSerializer < ActiveModel::Serializer
  attributes :id, :breed, :genre, :name, :owner, :phone, 
             :last_consultation, :birthday, :castrated
end
