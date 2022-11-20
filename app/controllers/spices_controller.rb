class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_error_method
    def index
        render json: Spice.all
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice, status: :accepted
    end

    def destroy
        spice = find_spice
        spice.destroy
        render json: spice, status: :no_content
    end


    private
    def find_spice
        Spice.find_by(id: params[:id])
    end
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
    def not_found_error_method
       ActiveRecord::RecordNotFound
    end
end
