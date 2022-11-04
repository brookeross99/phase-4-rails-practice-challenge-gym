class MembershipsController < ApplicationController
# rescue_from ActiveRecord::RecordInvalid, with: :render_invalid
    # Could move up vto the app controller

    # GET /memberships
    def index
        gym=Gym.all
        render json: gym
    end

    # POST /memberships
    # def create
    #     membership=Membership.create(membership_params)
    #     if membership.valid?
    #         render json: membership, status: :created
    #     else
    #         # important error handling below. Should show what is going on!
    #         render json: {error: membership.errors.full_messages}, status: :unprocessable_entity
    #     end
    # end
    # creating but with the rescue action:
    def create
        membership=Membership.create!(membership_params)
        render json: membership, status: :created
    end

    private
    # creating a params use here:
    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

    # If you moved the entire method to the app controller this would also need to move too
    # Invalid method
    # def render_ivalid(invalid)
    #     byebug
    #     render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    # end
end