class Api::V1::BoardController < ApplicationController
    def index
        render json: Board.all.order(id: "DESC")
    end
    
    def rank
        render json: Board.group(:title).count.where(created: Time.zone..yesterday.beginning_of_day..Time.zone.today.end_of_day)
    end
end
