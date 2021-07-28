class BirdsController < ApplicationController

  def increment_likes
    bird = Bird.find_by(id: params[:id])
    bird.update(likes: bird.likes + 1)
    render json: bird
  end

  def update
    # find the bird we're trying to update
    # update the bird, using the data from the body
    # send a response with the updated bird
    bird = Bird.find_by(id: params[:id])
    bird.update(bird_params)
    render json: bird
  end

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  private

  def bird_params
    params.permit(:name, :species, :likes)
  end

end
