module Api
  module V1
    class ReviewsController < ApplicationController
      protect_from_forgery with: :null_session

      before_action :set_review, only: %i[destroy]

      def create
        review = airline.reviews.new(review_params)

        if review.save
          render json: ReviewSerializer.new(review).serializable_hash.to_json
        else
          render json: { error: review.errors.full_messages }, status: 422
        end
      end

      def destroy
        if @review.destroy
          head :no_content
        else
          render json: { error: @review.errors.full_messages }, status: 422
        end
      end

      private

      def airline
        @airline ||= Airline.find(params[:airline_id])
      end
      

      def set_review
        @review = Review.find(params[:id])
      end

      def review_params
        params.require(:review).permit(:title, :description, :score, :airline_id)
      end
    end
  end
end
