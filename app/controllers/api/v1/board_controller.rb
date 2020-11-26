class Api::V1::BoardController < ApplicationController
    def index
        render json: Board.all
    end
end
