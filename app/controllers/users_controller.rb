class UsersController < ApplicationController

  before_action :set_local

  def index
    @my_user = [current_user]

    @users = @local.users - @my_user
    @all_users = User.all - @users - @my_user
  end

  private

  def set_local
    @local = Local.find params[:local_id]
  end

end
