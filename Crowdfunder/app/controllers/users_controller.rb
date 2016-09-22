class UsersController < ApplicationController
   def new
     @user = User.new
   end

   def show
     @user = User.find(params[:id])
   end

   def create
     @user = User.new(user_params)
       if @user.save
         session[:id] = user.id
         redirect_to root_path, alert: "Account sucessfully created!"
       else
         flash.now[:alert] = 'Oops!'
         render :new
       end
   end

  #  def edit
  #    @user = User.find(params[:id])
  #  end

  #  def update
  #    @user = User.find(params[:id])
  #    if @user.update_attributes(user_edit_params)
  #      redirect_to user_url(@user)
  #    else
  #      render :edit
  #    end
  #  end

  #  def reservations
  #    @reservations = @user.reservations.all
  #  end

   private

   def user_params
       params.require(:user).permit(:email, :password, :password_confirmation, :fullname)
   end

  #  def user_edit_params
  #    params.require(:user).permit(:name, :phone, :email)
  #  end

end
