class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :upgrade, :downgrade]

  def show

  end

  def edit

  end

  def update
  	@user.update_attributes(user_params)
    if @user.save
      redirect_to user_path(@user)
    end
  end

  def destroy

  end

	def upgrade

		@user.update_attributes(:status => "premium")
		if @user.save
			respond_to do |format|
				format.html { redirect_to user_path(@user), notice: "You've been upgraded." }
			end
		end
	end
	def downgrade
		@user.update_attributes(:status => "free")
		if @user.save
			respond_to do |format|
				format.html { redirect_to user_path(@user), notice: "You've been downgraded" }
			end
		end
	end


private
  def set_user
  	@user = User.find(params[:id])
  end

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :status)
  end
end
