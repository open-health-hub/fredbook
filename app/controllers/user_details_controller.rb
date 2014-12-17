class UserDetailsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user_detail, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index

    if current_user.user_detail
      @user_detail = current_user.user_detail
      render :edit      
    else #First use, so let's redirect to new
      redirect_to new_user_detail_path
    end

  end

  def show
    respond_with(@user_detail)
  end

  def new
    @user_detail = UserDetail.new
    respond_with(@user_detail)
  end

  def edit
    if current_user.user_detail.nil?      
      redirect_to new_user_detail_path
    end
  end

  def create
    @user_detail = UserDetail.new(user_detail_params)
    @user_detail.user = current_user
    @user_detail.save

    respond_with(@user_detail)
  end

  def update
    @user_detail.update(user_detail_params)

    respond_with(@user_detail)
  end

  def destroy
    # This should blank all of the User Detail    
  end

  private
    def set_user_detail
      @user_detail = current_user.user_detail 
    end

    def user_detail_params
      params.require(:user_detail).permit(:first_name, :last_name, :needs, :carers, :cares_for)
    end
end
