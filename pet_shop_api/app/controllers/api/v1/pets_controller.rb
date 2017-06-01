class Api::V1::PetsController < ApplicationController
  before_action :set_pet, only: [:show]

  def index
    # pets = Pet.ransack(params[:q]).result.paginate(:page => params[:page], :per_page => 100)
    pets = Pet.ransack(params[:q]).result
    json_response(pets)
  end

  def show
    json_response(@pet)
  end

  private 
    def set_pet
      begin
        @pet = Pet.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        head 404
      end
    end
end
