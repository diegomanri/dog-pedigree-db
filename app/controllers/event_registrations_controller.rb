class EventRegistrationsController < ApplicationController


  def destroy
    @event_registration = EventRegistration.find(params[:id])
    current_user.event_registrations.destroy(@event_registration)
    flash[:success] = "Attendance canceled"
    redirect_to :back
  end

  def create
    @event = Event.find(params[:event_registration][:event_id])
    event_registration = current_user.event_registrations.build(event_id: @event.id)
    if event_registration.save
      flash[:success] = "You are now attending this event"
      redirect_to :back
    else
      flash[:danger] = "Something went wrong"
      redirect_to :back
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event_registration
    @event_registration = EventRegistration.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_registration_params
    params.require(:event_registration).permit(:attendee_id, :event_id)
  end

end
