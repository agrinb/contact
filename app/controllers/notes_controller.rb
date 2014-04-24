class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :set_mycontact, only: [:new, :index, :show, :edit, :update, :destroy]
  # GET /notes
  # GET /notes.json
  def index
    
    @user = User.find(params[:user_id])
    
    if @mycontact
      @notes = @mycontact.notes
    else
      @notes = Note.all
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @user = User.find(params[:user_id])
    @mycontact = Mycontact.find(params[:mycontact_id])
    @notes = @mycontact.notes
  end


  # GET /notes/new
  def new
    @user = User.find(params[:user_id])
    @note = @mycontact.notes.new
  end

  # GET /notes/1/edit
  def edit
    @user = User.find(params[:user_id])
    @mycontact = Mycontacts.find(params[:mycontact_id])
    @note = @mycontact.notes.find(params[:id])
  end

  # POST /notes
  # POST /notes.json
  def create
    
    @user = User.find(params[:user_id])
    @mycontact = Mycontact.find(params[:mycontact_id])
    @note = @mycontact.notes.new(note_params)
    
    respond_to do |format|
      if @note.save
        format.html { redirect_to user_mycontact_notes_path, notice: 'Note was successfully created.' }
        format.json { render action: 'show', status: :created, location: @note }
      else
        format.html { render action: 'new' }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    @user = User.find(params[:user_id])
    @mycontact = @user.mycontacts.find(params[:mycontact_id])
    @note = @mycontact.notes.find(params[:id])
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    def set_mycontact
      @mycontact = Mycontact.find(params[:mycontact_id]) rescue nil
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:note, :user_id, :mycontact_id)
    end
end
