class UsersController < ApplicationController
  before_filter :authenticate, :except => :index

  def index
    @users = User.paginate :per_page => G140[:users_per_page], :page => params[:page], :conditions => "status = 1", :order => 'id DESC'
  end

  def deactivate
  end

  def destroy
    current_user.deactivate!
    reset_session
    redirect_to root_path
  end
end
