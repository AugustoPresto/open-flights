module Api
  module V1
    class AirlinesController < ApplicationController
      protect_from_forgery with: :null_session

      before_action :set_airline, only: %i[show update destroy]

      def index
        airlines = Airline.all

        render json: AirlineSerializer.new(airlines, options).serializable_hash.to_json
      end

      def show
        render json: AirlineSerializer.new(@airline, options).serializable_hash.to_json
      end

      def create
        airline = Airline.new(airline_params)

        if airline.save
          render json: AirlineSerializer.new(airline).serializable_hash.to_json
        else
          render json: { error: airline.errors.message }, status: 422
        end
      end

      def update
        if @airline.update(airline_params)
          render json: AirlineSerializer.new(@airline, options).serializable_hash.to_json
        else
          render json: { error: @airline.errors.message }, status: 422
        end
      end

      def destroy
        if @airline.destroy
          head :no_content
        else
          render json: { error: @airline.errors.message }, status: 422
        end
      end

      private

      def set_airline
        @airline = Airline.find_by(slug: params[:slug])
      end
      
      def airline_params
        params.require(:airline).permit(:name, :image_url)
      end

      def options
        @options ||= { include: %i[reviews] }
      end
    end
  end
end
