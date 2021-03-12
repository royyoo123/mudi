class BookmarksController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create, :destroy]
	def new
		@event = Event.find(params[:event_id])
		@bookmark = Bookmark.new
		authorize @bookmark
	end
	def create
		@user = current_user
		# bookmark = params[:bookmark]
		@event = Event.find(params[:bookmark][:event_id])
		@bookmark = Bookmark.new()
		@bookmark.user = @user
		@bookmark.event = @event
		authorize @bookmark
		@bookmark.save!
		return @bookmark
	 #  if params[:latitude] && params[:longitude]
		# 	redirect_to events_path(latitude: params[:latitude],longitude:params[:longitude])
		# else
		# 	redirect_to events_path
		# end
	end

	def index
		@bookmarks = current_user.bookmarks.order(created_at: :desc)
		@bookmarks = policy_scope(@bookmarks)
	end
	def destroy
		@bookmark = Bookmark.find_by(event_id: params[:id], user_id: current_user.id)
		authorize @bookmark
		@bookmark.destroy
		# if params[:latitude] && params[:longitude]
		# 	redirect_to events_path(latitude: params[:latitude],longitude:params[:longitude])
		# else
		# 	redirect_to events_path
		# end
		@bookmark
	end

	private
	def bookmark_params
		params.require(:bookmark).permit(:event_id)
	end
	
end
