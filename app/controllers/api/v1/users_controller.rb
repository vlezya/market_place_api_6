class Api::V1::UsersController < ApplicationController
  
  #GET /users/:id
  def show
    render json: User.find(params[:id])
  end
  
  #POST /users
  def create
    @user = User.create(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
