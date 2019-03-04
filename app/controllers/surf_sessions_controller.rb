require 'date'

class SurfSessionsController < ApplicationController
  # before_action :set_surf_session, only: [:create, :edit, :destroy]

  def index
    @surf_sessions = SurfSession.all
  end

  def create
  end

  def destroy
    @surf_session = SurfSession.find(params[:id])
    @surf_session_id = @surf_session.id
     if @surf_session.destroy
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

  private

  # def set_surf_session
  #   @surf_session = SurfSession.find(params[:id])
  # end

  # def surf_session_params
  #   params.require(:painting).permit(:name, :location, :price, :author, :style, :availabilities, :photo)
  # end
end
