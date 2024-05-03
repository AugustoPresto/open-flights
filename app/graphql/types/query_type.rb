# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.


    field :airlines, [Types::AirlineType], null: false do
      description "Returns a list of airlines"
    end

    def airlines
      Airline.all
    end

    field :reviews, [Types::ReviewType], null: false do
      description "Returns a list of reviews"
    end

    def reviews
      Review.all
    end

    field :airline, Types::AirlineType, null: true do
      description "Returns an airline"
      argument :slug, String, required: true
    end

    def airline(slug:)
      Airline.find_by(slug: slug)
    end

    field :review, Types::ReviewType, null: true do
      description "Returns a review"
      argument :id, ID, required: true
    end

    def review(id:)
      Review.find(id)
    end

    field :avg_score, Float, null: true do
      description "Returns the average score of all reviews"
    end

    def avg_score
      Review.average(:score).round(2).to_f
    end

    field :avg_score_by_airline, Float, null: true do
      description "Returns the average score of all reviews for a specific airline"
      argument :slug, String, required: true
    end

    def avg_score_by_airline(slug:)
      airline = Airline.find_by(slug: slug)
      airline.reviews.average(:score).round(2).to_f
    end

    field :avg_score_by_airline_id, Float, null: true do
      description "Returns the average score of all reviews for a specific airline"
      argument :id, ID, required: true
    end

    def avg_score_by_airline_id(id:)
      airline = Airline.find(id)
      airline.reviews.average(:score).round(2).to_f
    end

    field :avg_score_by_airline_name, Float, null: true do
      description "Returns the average score of all reviews for a specific airline"
      argument :name, String, required: true
    end

    def avg_score_by_airline_name(name:)
      airline = Airline.find_by(name: name)
      airline.reviews.average(:score).round(2).to_f
    end

    field :avg_score_by_airline_slug, Float, null: true do
      description "Returns the average score of all reviews for a specific airline"
      argument :slug, String, required: true
    end

    def avg_score_by_airline_slug(slug:)
      airline = Airline.find_by(slug: slug)
      airline.reviews.average(:score).round(2).to_f
    end
  end
end
