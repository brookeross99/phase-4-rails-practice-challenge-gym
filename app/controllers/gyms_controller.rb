class GymsController < ApplicationController
    # GET /gyms
    def index
        gyms=Gym.all 
        render json: gyms 
    end  
   
    # GET /gyms/:id-- wrote the below code as a rescue in the app controller.
    def show
        gym=Gym.find(params[:id])
        render json: gym
    end

    #PATCH /gyms/:id (udating the gyms here)
    def update
        gym=Gym.find(params[:id])
        if gym
            gym.update(gym_params)
            render json: gym, status: :accepted
        else
            render json: {error:"Gym not Found!"}, status: :not_found
        end
    end

    # DELETE /gym/:id
    # Wrote code in the app controller so now if it is not found an error is already put up and we do not need an if else to do it. 
    def destroy
        gym=Gym.find(params[:id])
        gym.destroy
        head :no_content
    end

    # GET /gyms/:id-- wrote the below code as a rescue in the app controller.
    # def show
    #     gym=Gym.find(params[:id])
    #     if gym
    #         render json: gym
    #     else
    #         render json: {error:"Gym not Found!"}, status: :not_found
    #     end
    # end

    # Association is already in the models that deletes clients if a gym has ended.
    # Below code is not needed as we added a rescue in the app controller
    # def destroy
    #     gym=Gym.find(params[:id])
    #     if gym
    #         gym.destroy
    #         head :no_content
    #     else
    #         render json:{error:"Gym not found!"}, status: :not_found
    #     end 
    # end

    private
    # Creating params use here
    def gym_params
        params.permit(:name, :address)
    end
end
