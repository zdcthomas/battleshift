class Api::V1::GamesController < ApiController

  def create
    find_opponent
    player_1_board = Board.new
    player_2_board = Board.new
    game = @user.games.create(player_1_board: player_1_board, player_2_board: player_2_board, player_1_turns: 0, player_2_turns: 0, current_turn: "player_1")
    game.participants.create(user: @opponent)

    if game
      render json: game
    else 
      render json: error
    end
  end

  def show
    if game ||= Game.find_by_id(params[:id])
      render json: game
    else
      render status:400
    end
  end

  private

  def find_opponent
    if opp_email && set_opp
    else
      render :error
    end
  end

  def opp_email
    params["opponent_email"]
  end

  def set_opp
    @opponent = User.find_by_email(opp_email)
  end

end
