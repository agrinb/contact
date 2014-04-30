class UserfilesController < ApplicationController
  before_action  :set_meeting, only: [:show, :edit, :update, :destroy]
  before_action :set_userfile, only: [:edit, :show, :update, :destroy]

  # GET /userfiles
  # GET /userfiles.json
  def index
    @user = User.find(params[:user_id])
    @mycontact = Mycontact.find(params[:mycontact_id])
    @meeting = Meeting.find(params[:meeting_id])
    if @meeting
      @userfiles = @meeting.userfiles
    else
      @userfiles = Userfile.all
    end
  end

  # GET /userfiles/1
  # GET /userfiles/1.json
  def show
    @meeting = Meeting.find(params[:meeting_id])
    @userfiles = @meeting.userfiles
  end

  # GET /userfiles/new
  def new
    @user = User.find(params[:user_id])
    @mycontact = Mycontact.find(params[:mycontact_id])
    @meeting = Meeting.find(params[:meeting_id])
    @userfile = @meeting.userfiles.new
end

  # GET /userfiles/1/edit
  def edit
  end

  def download
    # id = params[:id]
    # doc = Userfile.find(id)
    # if doc != nil
    #   userId = session[:user_id]
    #   tmpFileName = userId.to_s + "_" + doc.filename
    #   fileName = Rails.root.join('public','uploads', tmpFileName)
    #   send_file(fileName, filename: doc.file_name_slug, type: "application/text")
    # end
    doc = Userfile.find(params[:id])
    send_file(Rails.root.join('public', 'uploads', doc.file_name_slug))
  end

  # POST /userfiles
  # POST /userfiles.json
  def create
    @user = User.find(params[:user_id])
    @mycontact = Mycontact.find(params[:mycontact_id])
    @meeting = Meeting.find(params[:meeting_id])
    @userfile = @meeting.userfiles.new(userfile_params)

    uploadedIo = params[:userfile][:doc]
    @userfile.filename = uploadedIo.original_filename
    meetingId = @meeting.id
    tmpFileName = meetingId.to_s + "_" + [uploadedIo.original_filename.split(".").first.downcase.parameterize, ".", uploadedIo.original_filename.split(".").last].join()
    @userfile.file_name_slug = tmpFileName


    fileName = Rails.root.join('public','uploads', tmpFileName)
     File.open(fileName, 'wb') do |file|
      file.write(uploadedIo.read)
    end

    respond_to do |format|
      if @userfile.save
        #format.html { redirect_to @userfile, notice: 'Userfile was successfully created.' }
        format.html { redirect_to user_mycontact_meeting_userfiles_path}
        format.json { render action: 'show', status: :created, location: @userfile }
      else
        format.html { render action: 'new' }
        format.json { render json: @userfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userfiles/1
  # PATCH/PUT /userfiles/1.json
  def update
    respond_to do |format|
      if @userfile.update(userfile_params)
        format.html { redirect_to @userfile, notice: 'Userfile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @userfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userfiles/1
  # DELETE /userfiles/1.json
  def destroy
    @userfile.destroy

    fileName = Rails.root.join('public','uploads', @userfile.file_name_slug)
    File.delete(fileName) if File.exist?(fileName)

    respond_to do |format|
      format.html { redirect_to user_mycontact_meeting_userfiles_path }
      format.json { head :no_content }
    end
  end

  private
    def set_meeting
      @meeting = Meeting.find(params[:meeting_id]) rescue nil
    end

  # Use callbacks to share common setup or constraints between actions.
    def set_userfile
      @userfile = Userfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userfile_params
      params.require(:userfile).permit(:filename, :user_id, :mycontact_id, :meeting_id, :references)
    end
end
