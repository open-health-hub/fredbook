class MedicalEventsController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_medical_event, only: [:show, :edit, :update, :destroy]

  # GET /medical_events
  # GET /medical_events.json
  def index
    @medical_events = MedicalEvent.all
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
      @medical_event = MedicalEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medical_event_params
      params.require(:medical_event).permit(:summary, :description, :occurred_at, :user_id)
    end
end
