class Api::V1::BoardController < ApplicationController
    def index
        render json: Board.all.order(id: "DESC")
    end
end
