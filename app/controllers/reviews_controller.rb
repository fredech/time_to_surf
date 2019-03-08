class ReviewsController < ApplicationController
  # before_action :set_review, only: [:new]

  def index
    @reviews = Review.all
  end

  def new
    @surf_session = SurfSession.find(params[:surf_session_id])
    @review = Review.new
    @reviews = Review.all
  end

  def create
    @surf_session = SurfSession.find(params[:surf_session_id])
    @review = Review.new(review_params)
    @review.surf_session = @surf_session
    @review.surf_session.spot = @surf_session.spot
    if @review.save
      redirect_to dashboard_path, notice: 'Your review was successfully created!'
    else
      redirect_to dashboard_path, notice: 'Sorry, we couldn\'t create this review'
    end
  end

  def destroy
    @address = set_params(:address)
    @start_time = set_params(:start_time)
    @travel_time = set_params(:travel_time)

    @spot = Spot.find(params[:spot_id])
    @review = spot.review
    @review.destroy
    redirect_to spots_path
  end

  private

  def set_params(element)
    params[:search].nil? ? params[element] : params[:search][element]
  end

  def review_params
    params.require(:review).permit(:content, :rating, :photo, :facilities, :access, :condition)
  end
end
