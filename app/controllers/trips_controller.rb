class TripsController < ApplicationController
  def new
    @trip = Trip.new
    @user = current_user
  end

  def create
    @trip = Trip.create(trip_params)

    if @trip.save
      redirect_to feed_path
    else
      render :new
    end
  end

  def show
  end
  private

  def trip_params
    params.require(:trip).permit(:title,
                                 :start_date,
                                 :end_date,
                                 :user_id)
  end
end