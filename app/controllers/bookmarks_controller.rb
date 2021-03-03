class BookmarksController < ApplicationController
	def new
		@event = Event.find(params[:event_id])
		@bookmark = Bookmark.new
		authorize @bookmark
	end
	def create
		@user = current_user
		bookmark = params[:bookmark]
		@event = Event.find(bookmark[:event_id])
		@bookmark = Bookmark.new()
		@bookmark.user = @user
		@bookmark.event = @event
		authorize @bookmark
		@bookmark.save
	  if params[:latitude] && params[:longitude]
			redirect_to events_path(latitude: params[:latitude],longitude:params[:longitude])
		else
			redirect_to events_path
		end
	end

	def index
		@bookmarks = current_user.bookmarks.order(created_at: :desc)
		@bookmarks = policy_scope(@bookmarks)
	end
	def destroy
		@user = current_user
		@bookmark = Bookmark.find(params[:id])
		authorize @bookmark
		@bookmark.destroy
		if params[:latitude] && params[:longitude]
			redirect_to events_path(latitude: params[:latitude],longitude:params[:longitude])
		else
			redirect_to events_path
		end
	end
end
