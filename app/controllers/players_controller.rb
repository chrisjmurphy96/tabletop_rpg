# This would probably be better off as an Action Cable
# https://guides.rubyonrails.org/action_cable_overview.html
# However, I can't imagine most jobs care about this over regular
# REST, so I'll be sticking to this
class PlayersController < ApplicationController
  def update
    # Safely permit params.
    # https://mojoauth.com/serialize-and-deserialize/serialize-and-deserialize-json-with-ruby-on-rails/#deserializing-json-data
    # To validate at the record layer, see https://guides.rubyonrails.org/active_record_validations.html
    # The newest Rails option seems to be params.expect, which would look like:
    # params.expect(:player, [:id, :style_left, :style_top, :color, :name])
    player_params = params.require(:player).permit(:id, :style_left, :style_top, :color, :name)
    if player_params[:id] != nil
      updated_player = Player.find(player_params[:id])
      updated_player.style_left = player_params[:style_left]
      updated_player.style_top = player_params[:style_top]
      updated_player.color = player_params[:color]
      updated_player.name = player_params[:name]
    else
      updated_player = Player.new(player_params)
    end
    if updated_player.save
      render plain: updated_player.id, status: :created
    else
      render json: updated_player.errors.full_messages, status: :unprocessable_entity
    end
  end

  def get
    player_id = params.expect(:id)
    player = Player.find(player_id)
    render json: player
  end

  # Basic pagination token endpoint. paging_token is the id of a particular Player
  def get_page
    page_size = params.expect(:page_size)
    params.permit(:paging_token)
    paging_token = params[:paging_token]
    if not paging_token.blank?
      # this feels like an awkward solution, but it works.
      # I couldn't find a "take from" method or anything like that
      players = Player.where([ "id >= #{paging_token}" ]).take(page_size)
    else
      players = Player.take(page_size)
    end
    continuation_token = nil
    next_player = Player.where([ "id > #{players.last.id}" ]).first
    if next_player != nil
      continuation_token = next_player.id
    end
    render json: { players: players, continuation_token: continuation_token }, status: :ok
  end
end
