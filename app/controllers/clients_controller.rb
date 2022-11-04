class ClientsController < ApplicationController
    # GET /clients (showing all)
    def index
        clients=Client.all
        render json: clients
    end
    
    # GET /client/:id
    def show
        client=Client.find(params[:id])
        if client
            render json: client
        else
            render json: {error:"Client not Found!"}, status: :not_found
        end
    end

    # PATCH /clients/:id (updating)
    def update
        client=Client.find(params[:id])
        if client
            client.update(client_params)
            render json: client, status: :accepted
        else
            render json: {error:"Client not Found!"}, status: :not_found
        end
    end

    private
    def client_params
        params.permit(:name, :age)
    end
end
