class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def show
  end

  def create
    @post = Post.create!(post_params)

    respond_to do |format|
      if @post.save
        flash[:success] = "Your post has been created!"
        format.html { redirect_to @post}
        format.json { render :show, status: :created, location: @post }
      else
        flash.now[:alert] = "Something went wrong! Please try again"
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Update successful!!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Update unsuccessful :( please try again"
      render :edit
    end 
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  # def get_user
  #   post = Post.find_by(id: params[:id])
  #   @user = User.find_by(id: post.user_id)
  # end

  def post_params
    params.require(:post).permit(:image, :caption, :username)
  end
end