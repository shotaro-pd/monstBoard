class Api::V1::BoardController < ApplicationController
    def index
        render json: Board.all.order(id: "DESC")
    end
    
    def rank
        #render json: Board.all.order(id: "ASC")
        render json: Board.group(:title).count.where(created: Time.zone.now.yesterday..Time.zone.now)
    end
end
