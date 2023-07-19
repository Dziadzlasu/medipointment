class PatientsController < ApplicationController

  def index
    @q = Patient.ransack(params[:q])
    @pagy, @patients = pagy(@q.result, items: 30)
  end

  def appointments
    @patient = Patient.find(params[:id])
    appointments = @patient.appointments
    @pagy, @appointments = pagy(appointments.all, items: 30)
  end
end
