class CommentsController < ApplicationController
  before_action :set_entry, only: %i[ create ]

  def create
    @new_comment = @entry.comments.new(comment_params)

    if @new_comment.save
      redirect_to entry_slug_path(@entry.slug)
    else
      # set the @comments variable that the view expects
      @comments = @entry.comments.persisted
      render "entries/show", status: :unprocessable_content
    end
  end

  private
    def set_entry
      @entry = Entry.find(params[:entry_id])
    end

    def comment_params
      params
        .expect(comment: [ :name, :email, :url, :comment ])
        .with_defaults({ user: Current.user })
    end
end
