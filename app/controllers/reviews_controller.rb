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
      redirect_to dashboard_path
      # notice: 'Your review was successfully created!'
    else
      redirect_to dashboard_path
      # notice: 'Sorry, we couldn\'t create this review'
    end
  end

  def destroy
    @spot = Spot.find(params[:spot_id])
    @review = spot.review
    @review.destroy
    redirect_to spots_path
  end

  # def destroy
  #   @spot = Spot.find(params[:id])
  #   @review = spot.review
  #   @review_id = @review.id
  #   if @review.destroy
  #     respond_to do |format|
  #       format.html { redirect_to dashboard_path }
  #       format.js { } # <-- will render `app/views/reviews/create.js.erb`
  #     end
  #   else
  #     respond_to do |format|
  #       format.html { render 'dashboard' }
  #       format.js { } # <-- idem
  #     end
  #   end
  # end


  # private

  # def set_review
  #   @review = Review.find(params[:id])
  # end

  def review_params
    params.require(:review).permit(:content, :rating, :photo, :facilities, :access, :condition)
  end
end
