class MycontactsController < ApplicationController
  before_action :set_mycontact, only: [:show, :edit, :update, :destroy]


  # GET /mycontacts
  # GET /mycontacts.json
  def index
    @user = User.find(params[:user_id])
    if params.has_key?(:search)
      #@mycontacts = Mycontact.where("last_name like '% ? %' ", params[:search])
      @mycontacts = Mycontact.where("last_name like ?", "%#{params[:search]}%")
    else
      @mycontacts = @user.mycontacts
    end
  end

  # GET /mycontacts/1
  # GET /mycontacts/1.json
  def show
    @user = User.find(params[:user_id])
    @mycontact = @user.mycontacts.find(params[:id])
    @notes = @mycontact.notes
  end

  # GET /mycontacts/new
  def new
    # @mycontact = Mycontact.new
    @user = User.find(params[:user_id])
    @mycontact = @user.mycontacts.new
  end

  # GET /mycontacts/1/edit
  def edit
    @user = User.find(params[:user_id])
  end

  # POST /mycontacts
  # POST /mycontacts.json
  def create
    # @mycontact = Mycontact.new(mycontact_params)
    @user = User.find(params[:user_id])
    @mycontact = @user.mycontacts.create(mycontact_params)
    respond_to do |format|
      if @mycontact.save
        format.html { redirect_to user_mycontact_path(@user, @mycontact), notice: 'Mycontact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mycontact }
      else
        format.html { render action: 'new' }
        format.json { render json: @mycontact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mycontacts/1
  # PATCH/PUT /mycontacts/1.json
  def update
    @user = User.find(params[:user_id])
    respond_to do |format|
      if @mycontact.update(mycontact_params)
        format.html { redirect_to user_mycontact_path(@user, @mycontact), notice: 'Mycontact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mycontact.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /mycontacts/1
  # DELETE /mycontacts/1.json
  def destroy
    @user = User.find(params[:user_id])
    @mycontact.destroy
    respond_to do |format|
      format.html { redirect_to user_mycontacts_path(@user) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mycontact
      @mycontact = Mycontact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mycontact_params
      params.require(:mycontact).permit(:first_name, :last_name, :email_busines, :email_personal, :user_id, :email_business, :phone_number, :phone_number_2, :address, :address2, :city, :state, :zip)
    end
end
