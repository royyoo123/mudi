class BookmarksController < ApplicationController
	def new
		@event = Event.find(params[:event_id])
		@bookmark = Bookmark.new
		authorize @bookmark
	end
	def create
		@user = current_user
		@event = Event.find(params[:event_id])
		@bookmark = Bookmark.new()
		@bookmark.user = @user
		@bookmark.event = @event
		authorize @bookmark
		@bookmark.save
	  redirect_to confirmed_path(@event)
	end

	def index
		@bookmarks = current_user.bookmarks.order(created_at: :desc)
		@bookmarks = policy_scope(@bookmarks)
	end
end
