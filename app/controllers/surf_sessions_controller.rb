require 'date'

class SurfSessionsController < ApplicationController
  # before_action :set_surf_session, only: [:create, :edit, :destroy]

  def index
    @surf_sessions = SurfSession.all
  end


  def create
    @surf_session = SurfSession.new(surf_session_params)
    @surf_session.user_id = current_user
    if @surf_session.save
      redirect_to dashboard_path, notice: 'Your surf session was successfully created!'
    else
      redirect_to :back, notice: 'Sorry, we couldn\'t create this surf session'
    end
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

  def surf_session_params
    params.require(:surf_session).permit(:start_time, :spot_id)
  end
end
