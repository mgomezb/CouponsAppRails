class Api::V1::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  def create
    @user = User.create(user_params)
    @user.user_type = 'mobile'
    if @user.save
      render :json => {:user => @user }
    else
      render :json => {:error => @user.errors.full_messages}
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :address, :rut, :name, :last_name, :gender)
  end
end