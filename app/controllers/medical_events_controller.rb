class MedicalEventsController < ApplicationController

  before_filter :require_user_signed_in

  before_action :set_medical_event, only: [:show, :edit, :update, :destroy]

  # GET /medical_events
  # GET /medical_events.json
  def index
    @medical_events = current_user.medical_events.order(occurred_at: :desc)
  end

  def horizontal
    # An experiment to see how the time would look in a 
    @medical_events = current_user.medical_events.order(id: :asc)

    render :layout => 'main'
  end

  # GET /medical_events/1
  # GET /medical_events/1.json
  def show
  end

  # GET /medical_events/new
  def new
    @medical_event = MedicalEvent.new
  end

  # GET /medical_events/1/edit
  def edit
  end

  # POST /medical_events
  # POST /medical_events.json
  def create
    @medical_event = MedicalEvent.new(medical_event_params)
    @medical_event.user = current_user

    respond_to do |format|
      if @medical_event.save
        format.html { redirect_to @medical_event, notice: 'Medical event was successfully created.' }
        format.json { render :show, status: :created, location: @medical_event }
      else
        format.html { render :new }
        format.json { render json: @medical_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medical_events/1
  # PATCH/PUT /medical_events/1.json
  def update
    respond_to do |format|
      if @medical_event.update(medical_event_params)
        format.html { redirect_to @medical_event, notice: 'Medical event was successfully updated.' }
        format.json { render :show, status: :ok, location: @medical_event }
      else
        format.html { render :edit }
        format.json { render json: @medical_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_events/1
  # DELETE /medical_events/1.json
  def destroy
    @medical_event.destroy
    respond_to do |format|
      format.html { redirect_to medical_events_url, notice: 'Medical event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_medical_event      
      # We need to scope this to the current_user so that other users cannot access their events.
      begin
        @medical_event = current_user.medical_events.find(params[:id])
      rescue ActiveRecord::RecordNotFound => not_users_record_exception
        Rails.logger.error "Current User: #{current_user.email} is attempting to access someone elses record - MedicalEvent: #{params[:id]}"
        redirect_to :root, notice: 'You do not have permission to access that.'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medical_event_params
      params.require(:medical_event).permit(:summary, :description, :occurred_at)
    end
end
