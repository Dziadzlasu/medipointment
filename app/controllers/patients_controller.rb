class PatientsController < ApplicationController

  def index
    filtered = Patient.all.order(params[:sort])
    @pagy, @patients = pagy(filtered.all, items: 30)
  end
end
