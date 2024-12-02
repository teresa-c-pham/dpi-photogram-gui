class CommentsController < ApplicationController
  def create
    @the_comment = Comment.new
    @the_comment.author_id = params.fetch("query_author_id")
    @the_comment.photo_id = params.fetch("query_photo_id")
    @the_comment.body = params.fetch("query_comment")

    if @the_comment.valid?
      @the_comment.save
      redirect_to("/photos/#{@the_comment.photo_id}", { :notice => "Comment created successfully." })
    else
      redirect_to("/photos/#{params.fetch("query_photo_id")}", { :notice => "Comment failed to create successfully." })
    end
  end
end
