class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    private
    def render_ivalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def render_not_found(not_found)
        render json: {error: not_found.message}, status: :not_found
    end
end
