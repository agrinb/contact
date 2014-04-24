class MeetingsController < ApplicationController
  before_action :set_mycontact, only: [:new, :index, :show, :edit, :update, :destroy]
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]


  # GET /meetings
  # GET /meetings.json
  def index
    @user = User.find(params[:user_id])
    @mycontact = Mycontact.find(params[:mycontact_id])
    if @mycontact
      @meetings = @mycontact.meetings
    else
      @meetings = Meeting.all
    end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @user = User.find(params[:user_id])
    @mycontact = Mycontact.find(params[:mycontact_id])
    @meetings = @mycontact.meetings
  end


  # GET /meetings/new
 def new
  @user = User.find(params[:user_id])
  @mycontact = Mycontacts.find(params[:mycontact_id])
  @meeting = Metting.find(params[:meeting_id])
  @userfile = @meeting.userfiles.new
end

  # GET /meetings/1/edit
  def edit
    @user = User.find(params[:user_id])
    @mycontact = Mycontacts.find(params[:mycontact_id])
    @meeting = @mycontact.meetings.find(params[:id])
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @user = User.find(params[:user_id])
    @mycontact = Mycontact.find(params[:mycontact_id])
    @meeting = @mycontact.meetings.new(meeting_params)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to user_mycontact_meetings_path, notice: 'Meeting was successfully created.' }
        format.json { render action: 'show', status: :created, location: @meeting }
      else
        format.html { render action: 'new' }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    @user = User.find(params[:user_id])
    @mycontact = @user.mycontacts.find(params[:mycontact_id])
    @meeting= @mycontact.meetings.find(params[:id])
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:meeting_id]) rescue nil
    end

    def set_mycontact
      @mycontact = Mycontact.find(params[:mycontact_id]) rescue nil
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:meeting, :user_id, :mycontact_id)
    end
end
