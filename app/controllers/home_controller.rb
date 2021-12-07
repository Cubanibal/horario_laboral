class HomeController < ApplicationController
 
  def index
    # Scope your query to the dates being shown:
    start_time = params.fetch(:start_date, Date.today).to_date
    @cita = Evento.where(start_time: start_time.beginning_of_month.beginning_of_week..start_time.end_of_month.end_of_week)
    @dias_trabajo = 0
     @dias_vaca = 0
  end 
end
