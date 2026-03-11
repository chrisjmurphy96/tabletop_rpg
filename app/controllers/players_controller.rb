class PlayersController < ApplicationController
  def update
    # Safely permit params. I guess this is the Ruby version of "expect" statements
    # https://mojoauth.com/serialize-and-deserialize/serialize-and-deserialize-json-with-ruby-on-rails/#deserializing-json-data
    # To validate at the record layer, see https://guides.rubyonrails.org/active_record_validations.html
    @player_params = params.require(:player).permit(:id, :style_left, :style_top, :color, :name)
    if @player_params[:id] != nil
      @updated_player = Player.find(@player_params[:id])
      @updated_player.style_left = @player_params[:style_left]
      @updated_player.style_top = @player_params[:style_top]
      @updated_player.color = @player_params[:color]
      @updated_player.name = @player_params[:name]
    else
      @updated_player = Player.new(@player_params)
    end
    if @updated_player.save
      render plain: @updated_player.id, status: :created
    else
      render json: @updated_player.errors.full_messages, status: :unprocessable_entity
    end
  end
end
