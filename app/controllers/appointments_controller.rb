class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:edit, :update, :destroy]

  def index
    @appointments = Appointment.all
  end

  def new
    binding.pry
    @appointment = Appointment.new
    @patient_id = params[:patient]
    @physicians = Physician.all
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to appointments_path, notice: "Appointment was successfully added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @physicians = Physician.all
    @patient_id = params[:patient]
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to appointments_path, notice: "Appointment was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path, notice: "Appointment was successfully cancelled."
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:start_time, :patient_id, :physician_id, :price)
  end
end
