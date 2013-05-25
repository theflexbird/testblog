class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show,:index]
  expose_decorated(:posts)
  expose_decorated(:post)

  before_filter :display_flash_notice, :except => :index

  def index
  end

  def posts
    Post.where(:archived => 0).all
  end

  def new
  end

  def edit
  end

  def update
    if post.save
      render action: :index
    else
      render :new
    end
  end

  def destroy
    post.destroy if post.user_id == current_user.id
    render action: :index
  end

  def show
  end

  def mark_archived
    post.update_attributes!(archived: true)
    post.save!
    render action: :index
  end

  def create
    post.user_id = current_user.id
    if post.save
      redirect_to action: :index
    else
      render :new
    end
  end

end
