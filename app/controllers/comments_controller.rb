class CommentsController < ApplicationController
  before_action :set_entry, only: %i[ create ]
  before_action :capture_spam, only: %i[ create ]
  before_action :set_comment, only: %i[ destroy ]

  class SpamComment < StandardError; end

  rescue_from SpamComment do |error|
    redirect_to entry_slug_path(@entry.slug)
  end

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

  def destroy
    @comment.destroy!

    redirect_to entry_slug_path(@comment.entry.slug)
  end

  private
    def set_entry
      @entry = Entry.find(params[:entry_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params
        .expect(comment: [ :name, :email, :url, :comment ])
        .with_defaults({ user: Current.user })
    end

    def capture_spam
      if params.dig(:comment, :last_name).present?
        raise SpamComment
      end
    end
end
