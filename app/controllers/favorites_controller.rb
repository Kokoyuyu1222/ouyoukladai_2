class FavoritesController < ApplicationController
	def create
		book = Book.find(params[:book_id])
            favorite = current_user.favorites.new(book_id: book.id)
            favorite.save
            redirect_back(fallback_location: book_path(book))
            # redirect_to request.referer
	end
	def destroy
		 book = Book.find(params[:book_id])
            favorite = current_user.favorites.find_by(book_id: book.id)
            favorite.destroy
            redirect_back(fallback_location: book_path(book))
	end
	private
	def favorite_params
		params.require_params(:favorite).permit(:book_id)
	end
end
