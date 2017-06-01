FactoryGirl.define do
  factory :pet do
    name { Faker::Cat.name }
    genre { ['Macho', 'Fêmea'].sample }
    castrated [true, false].sample
    owner { Faker::Name.name }
    phone { Faker::Base.numerify('(##) #####-####') }
    breed { ['Bearded Collie', 'Otterhound', 'Grande Boiadeiro suíço', 'Kerry blue terrier'].sample }
    last_consultation { Faker::Date.backward(Random.rand(200)) }
    birthday { Faker::Date.birthday(0, 14) }
  end
end