class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show,:index]
  expose_decorated(:posts)
  expose_decorated(:post)

  def index
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
    post.destroy # if post.user_id = current_user.id
    render action: :index
  end

  def show
    render action: :index
  end

  def mark_archived
    #post.archived = true
    #post.save
  end

  def create
    if post.save
      redirect_to action: :index
    else
      render :new
    end
  end

end
