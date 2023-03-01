class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  
  private
  def render_unprocessable_entity_response(exception)
    render json: { errors: ["validation errors"] }, status: :unprocessable_entity
  end

  def render_not_found_response(exception)
    render json: { errors: exception.message }, status: :not_found
  end

end
