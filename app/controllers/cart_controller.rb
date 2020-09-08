class CartController < ApplicationController
  include ActionView::Helpers::TextHelper

  def update
    song = Song.find(params[:song_id])
    cart = Cart.new(session[:cart])
    cart.add_song(song)

    session[:cart] = cart.contents
    flash[:success] = "You now have #{pluralize(cart.quantity_of(song), 'copy')} of #{song.title} in your cart."
    redirect_to '/songs'
  end
end

# {
#   :cart => {
#     song_id => quantity,
#     54 => 2,
#     12 => 1,
#
#   }
# }
