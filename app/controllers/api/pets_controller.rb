class Api::PetsController < ApplicationController
  def show
    render json: { id: 1, name: 'pochi' }
  end
end
