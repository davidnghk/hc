class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :edit, :update, :destroy]
  before_action :set_type

  # GET /incidents
  # GET /incidents.json
  def index
    @incidents = type_class.all
  end

  # GET /incidents/1
  # GET /incidents/1.json
  def show
  end

  # GET /incidents/new
  def new
    @incident = type_class.new
    @type = type_class
  end

  # GET /incidents/1/edit
  def edit
    @type = type_class
  end

  # POST /incidents
  # POST /incidents.json
  def create
    @incident = type_class.new(incident_params)
    @incident.request_datetime = DateTime.now
    @incident.user = current_user

    respond_to do |format|
      if @incident.save
        format.html { redirect_to @incident, notice: 'Incident was successfully created.' }
        format.json { render :show, status: :created, location: @incident }
      else
        format.html { render :new }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidents/1
  # PATCH/PUT /incidents/1.json
  def update
    respond_to do |format|
      if @incident.update(incident_params)
        format.html { redirect_to @incident, notice: 'Incident was successfully updated.' }
        format.json { render :show, status: :ok, location: @incident }
      else
        format.html { render :edit }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidents/1
  # DELETE /incidents/1.json
  def destroy
    @incident.destroy
    respond_to do |format|
      format.html { redirect_to incidents_url, notice: 'Incident was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident
      @incident = type_class.find(params[:id])
    end

    def set_type 
       @type = type 
    end

    def type
        Incident.types.include?(params[:type]) ? params[:type] : "Incident"
    end

    def type_class 
        type.constantize 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_params
      params.require(type.underscore.to_sym).permit(:type, :task_id, :incident_datetime, :incident_time, :request_datetime, :location_id, :user_id, :ref, :status, :source, :responsible_user_id, :worker_user_id, :heading, :details)
    end
end
