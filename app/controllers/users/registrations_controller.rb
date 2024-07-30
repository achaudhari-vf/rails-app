class Users::RegistrationsController < Devise::RegistrationsController
  protect_from_forgery with: :null_session, if: -> { request.format.json? }
  include RackSessionFix
  respond_to :json
  skip_before_action :verify_authenticity_token, if: :json_request?
  
  private

  def respond_with(resource, _opts = {})
    if request.method == "POST" && resource.persisted?
      render json: {
        status: { code: 200, message: "Signed up successfully.",  user: resource.name }
      }, status: :ok
    elsif request.method == "DELETE"
      render json: {
        status: { code: 200, message: "Account deleted successfully." }
      }, status: :ok
    else
      render json: {
        status: { code: 422, message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end

  def json_request?
    request.format.json?
  end
end
