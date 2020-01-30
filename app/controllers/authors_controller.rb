class AuthorsController < ApplicationController
    def index
        @authors = Author.all
        json_response(@authors)
    end

    def show
        @author = Author.find(params[:id])
        json_response(@author)
    end

    def create
        @author = Author.create!(author_params)
        json_response(@author, 201)
    end

    def update
        @author = Author.find(params[:id])
        if @author.update!(author_params)
            render status: 200, json: {
                message: "This author (#{@author.name}) has been updated successfully."
            }
        end
    end

    def destroy
        @author = Author.find(params[:id])
        if @author.destroy!
            render status: 200, json: {
                message: "Destroyed author: #{@author.name}"
            }
        end
    end

    private
    def author_params
        params.permit(:name, :age)
    end
end
