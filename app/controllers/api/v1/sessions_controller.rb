class Api::V1::SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }
  # https://github.com/plataformatec/devise/blob/master/app/controllers/devise/sessions_controller.rb

  # POST /resource/sign_in
  # Resets the authentication token each time! Won't allow you to login on two devices
  # at the same time (so does logout).
  def create
   self.resource = warden.authenticate!(auth_options)
   sign_in(resource_name, resource)

   current_user.update authentication_token: nil

   respond_to do |format|
     format.json {
       render :json => {
         :user => current_user,
         :status => :ok,
         :authentication_token => current_user.authentication_token
       }
     }
   end
  end

  # DELETE /resource/sign_out
  def destroy
    @user = User.find_by_authentication_token(params[:authentication_token])

    if @user.nil?
      logger.info("Token not found.")
      render status: 404, json: {message: "Invalid token."}
    else
      @user.update authentication_token: nil
      render status: 200, json: {message: "Token cleaned"}
    end
  end
end