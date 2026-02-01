class Admin::CommentsController < AdminController
  def index
    @comments = Comment.includes(:entry).order(created_at: :desc)
  end
end
