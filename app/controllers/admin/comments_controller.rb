class Admin::CommentsController < ApplicationController
   before_action :admin_access

  def index
    @comments = Comment.order("created_at DESC").limit(100)
  end
end
