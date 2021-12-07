class EventosController < ApplicationController
  before_action :set_evento, only: %i[ show edit update destroy ]
  before_action :correct_user, only: %i[ edit update destroy ]
  before_action :authenticate_user!

  # GET /eventos or /eventos.json
  def index
    @eventos = Evento.all
  end

  # GET /eventos/1 or /eventos/1.json
  def show
  end

  # GET /eventos/new
  def new
    @evento = Evento.new
  end

  # GET /eventos/1/edit
  def edit
  end

  # POST /eventos or /eventos.json
  def create
    @evento = Evento.new(evento_params)

    respond_to do |format|
      if @evento.save
        format.html { redirect_to root_path, notice: "Evento se ha creado correctamente." }
        format.json { render :show, status: :created, location: @evento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos/1 or /eventos/1.json
  def update
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to root_path, notice: "Evento se ha actualizado correctamente." }
        format.json { render :show, status: :ok, location: @evento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1 or /eventos/1.json
  def destroy
    @evento.destroy
    respond_to do |format|
      format.html { redirect_to eventos_url, notice: "Evento se ha eliminado correctamente." }
      format.json { head :no_content }
    end
  end
  # Crear método para determinar el usuario correcto
  def correct_user
    @evento = current_user.eventos.find_by(id: params[:id])
    redirect_to root_path, notice: "No autorizado a editar" if @evento.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def evento_params
      params.require(:evento).permit(:name, :start_time, :end_time, :user_id)
    end
end
