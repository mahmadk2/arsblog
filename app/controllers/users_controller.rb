class UsersController < ApplicationController

def index
	@users = User.all 

end

def new
	@user =  User.new

end

def create
@user = User.new(user_params)
if @user.save
	flash[:success] = "wel come to blog #{@user.username}"
	redirect_to user_path
else
render 'new'
end
end

def edit
 @user = User.find(params[:id])
	end

	def update
   @user = User.find(params[:id])
   if @user.update(user_params)
   	flash[:success] = "user updated successfully"
   	redirect_to user_path(@user)
   else
   	render 'edit'
   end
	end

	def  show
	@user = User.find(params[:id]) 

	end
	def destroy

		@user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "user delete successfully"
    redirect_to users_path
  end


private
def user_params
params.require(:user).permit(:username,:email,:password)
	end

end