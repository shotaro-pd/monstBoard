class Api::V1::BoardController < ApplicationController
    def index
        render json: "Hello"
    end
end