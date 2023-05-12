class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @image_tag = @user.image_tag
  end

  def new
    @user = User.new
  end

  def create
    
  end

  def edit
    @user = User.find(params[:id])
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to books_path
     
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to book_path(@user.id)
    else
       render 'edit'
    end

  end

  def destroy
  end
  
  private

  def user_params
    params.require(:user).permit(:shop_name, :image, :caption)
  end
  
end
