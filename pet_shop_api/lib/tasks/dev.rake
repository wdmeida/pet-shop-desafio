require 'open-uri'

namespace :dev do

  desc "Setup Development"
  task setup: :environment do
    puts 'Configuring application...'
    puts "\nDeleting DB...\n"
    puts "#{%x(rake db:drop)}"
    puts "\nCreating DB...\n"
    puts "#{%x(rake db:create)}" 
    puts "\nGenerate migrations...\n"
    puts "#{%x(rake db:migrate)}"
    puts "\nConfiguring application [OK]\n\n"
  end

  ###################################################################

  desc "\nGetting data for initial configuration..."
  task initial_settings: :environment do

    HOST_GET_BREEDS = 'http://www.portalfilhotes.com.br/racas-de-a-z/'

    puts "\n#### Getting breeds of dogs in '#{HOST_GET_BREEDS}'..."

    doc = Nokogiri::HTML(open(HOST_GET_BREEDS))

    breeds = Array.new

    doc.css("#HOTWordsTxt > ul > li").each do |item| 
      breeds.push(item.text)  
    end

    puts "\n#### Getting breeds of dogs [OK] ####"

    ##################################################################

    puts "\n### Registering information for pets..."

    1000.times do
      Pet.create!(
        name: Faker::Cat.name,
        genre: ['Macho', 'Fêmea'].sample,
        castrated: [true, false].sample,
        owner: Faker::Name.name,
        phone: Faker::Base.numerify('(##) #####-####'),
        breed: breeds.sample,
        last_consultation: Faker::Date.backward(Random.rand(200)),
        birthday: Faker::Date.birthday(0, 14)
      )
    end

    puts "\n### Registering information for pets [OK] ###"

  end

end
