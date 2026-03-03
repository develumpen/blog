module Blog
  module Admin
    class CommentsController < AdminController
      def index
        @comments = Comment.includes(:entry).order(created_at: :desc)
      end
    end
  end
end
