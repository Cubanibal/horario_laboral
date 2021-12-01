class HomeController < ApplicationController
  def index
    # Scope your query to the dates being shown:
  fecha_inicial = params.fetch(:fecha_inicial, Date.today).to_date
  @eventos = Evento.where(fecha_inicial: fecha_inicial.beginning_of_month.beginning_of_week..fecha_inicial.end_of_month.end_of_week)
  end
end
