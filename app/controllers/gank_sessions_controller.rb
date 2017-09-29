class GankSessionsController < ApplicationController
  before_action :set_gank_session, only: [:show, :edit, :update, :destroy, :end, :loot]

  # GET /gank_sessions
  # GET /gank_sessions.json
  def index
    @gank_sessions = GankSession.all
  end

  # GET /gank_sessions/1
  # GET /gank_sessions/1.json
  def show
  end

  # GET /gank_sessions/new
  def new
    @gank_session = GankSession.new
    @gank_session.gank_session_characters.build
  end

  # GET /gank_sessions/1/edit
  def edit
  end

  # POST /gank_sessions
  # POST /gank_sessions.json
  def create
    @gank_session = GankSession.new(gank_session_params)

    respond_to do |format|
      if @gank_session.save
        format.html { redirect_to @gank_session, notice: 'Gank session was successfully created.' }
        format.json { render :show, status: :created, location: @gank_session }
      else
        format.html { render :new }
        format.json { render json: @gank_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gank_sessions/1
  # PATCH/PUT /gank_sessions/1.json
  def update
    respond_to do |format|
      if @gank_session.update(gank_session_params)
        format.html { redirect_to @gank_session, notice: 'Gank session was successfully updated.' }
        format.json { render :show, status: :ok, location: @gank_session }
      else
        format.html { render :edit }
        format.json { render json: @gank_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gank_sessions/1
  # DELETE /gank_sessions/1.json
  def destroy
    @gank_session.destroy
    respond_to do |format|
      format.html { redirect_to gank_sessions_url, notice: 'Gank session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /gank_sessions/1/end
  def end
    @gank_session.end_session
    respond_to do |format|
      format.html { redirect_to @gank_session, notice: 'Gank session complete!' }
    end
  end

  # POST /gank_sessions/1/loot
  def loot
    @gank_session.extract_response_values
    respond_to do |format|
      format.html { redirect_to @gank_session, notice: 'Loot updated!' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gank_session
      @gank_session = GankSession.find(params[:id] || params[:gank_session_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gank_session_params
      params.require(:gank_session).permit(gank_session_characters_attributes: [:character_id])
    end
end
