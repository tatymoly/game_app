class GamesController < ApplicationController
    def index
        render json: {

        wins_count: Game.where(result: 'win').count,
        lose_count: Game.where(result: 'lose').count,
        tie_count: Game.where(result: 'tie').count

        }
    end
    def create
        game = Game.new(permitted_params)
        if game.valid?
            set_game_result(game)
            game.save
            render json: game
        else 
            render json: { errors: game.errors }
        end
    end
    private
    def set_game_result(game)
        game.random_number = rand(1..100)
        dif_cpu_number = game.cpu_number - game.random_number
        dif_user_number = game.user_number - game.random_number
        return game.result = 'tie' if dif_cpu_number == dif_user_number
        return game.result = 'lose' if dif_cpu_number <= dif_user_number
        return game.result = 'win' if dif_cpu_number >= dif_user_number
    end
    def permitted_params
       params.permit(:user_number).merge(
           cpu_number: rand(1..100)
       )
    end
end
