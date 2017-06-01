require 'rails_helper'

RSpec.describe 'Pets API', type: :request do
  let!(:pets) { create_list(:pet, 20) }
  let(:id) { pets.first.id }
  let(:headers) do
    {
      'Accept' => 'application/vnd.petshopapi.v1',
      'Content-Type' => Mime[:json].to_s,
    }
  end

  before { host! 'localhost:3000' }

  describe 'GET /pets' do
    context 'when no filter param is sent' do
      before { get '/pets', params: {}, headers: headers }

      context 'when info pets exists' do
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end

        it 'returns json with 20 pets from database' do
          expect(json_body.count).to eq(20)        
          # expect(json_body[:data].count).to eq(20)        
        end

        it 'returns info pets correct' do
          # expect(json_body[:data][0][:id]).to eq(Pet.first[:id].to_s)
          expect(json_body[0][:id]).to eq(Pet.first[:id])
        end
      end

      context 'when info pets not exists' do

        let(:pets) { create_list(:pet, 0) }

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end

        it 'returns json without content' do
          # expect(json_body[:data].count).to eq(0)
          expect(json_body.count).to eq(0)
        end
      end
    end

    context 'when filter and sorting params are sent' do
      let!(:pastor_pet_1) { create(:pet, breed: 'Pastor Belga') }
      let!(:pastor_pet_2) { create(:pet, breed: 'Pastor Alemão') }
      let!(:other_pet_1) { create(:pet, owner: 'Han Solo') }
      let!(:other_pet_2) { create(:pet, owner: 'Anakym Skywalker') }

      before do
        get '/pets?q[breed_cont]=past&q[s]=breed+ASC', params: {}, headers: headers
      end

      it 'returns only the pets matching and in the correct order' do
        # returned_pets_breeds = json_body[:data].map { |p| p[:attributes][:breed]  }
        returned_pets_breeds = json_body.map { |p| p[:breed]  }

        expect(returned_pets_breeds).to eq([pastor_pet_2.breed, pastor_pet_1.breed])
      end
    end
   
  end

  describe 'GET /pets/:id' do
    context 'when request id pet is valid' do
      before { get "/pets/#{id}", params: {}, headers: headers }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns a json of requestd information' do
        # expect(json_body[:data][:id]).to eq(id.to_s)
        expect(json_body[:id]).to eq(id)
      end

      it 'returns a json with pet information' do
        # expect(json_body[:data][:attributes][:name]).to eq(pets.first.name)
        expect(json_body[:name]).to eq(pets.first.name)
      end
    end

    context 'when the request id pet is invalid' do
      let(:id) { 99999 }

      before { get "/pets/#{id}", params: {}, headers: headers }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end