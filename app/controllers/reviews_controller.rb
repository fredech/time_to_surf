class ReviewsController < ApplicationController
  # before_action :set_review, only: [:create, :new]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.surf_session = SurfSession.find(params[:id])
    @review.surf_session.spot = Spot.find(params[:id])
    if @review.save
      redirect_to spot_path(@spot), notice: 'Your review was successfully created!'
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review_id = @review.id
    if @review.destroy
      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.js { } # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'dashboard' }
        format.js { } # <-- idem
      end
    end
  end

  # private

  # def set_review
  #   @review = Review.find(params[:id])
  # end

  # def review_params
  #   params.require(:review).permit(:content, :rating, :photo)
  # end
end
