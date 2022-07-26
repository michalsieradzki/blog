class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_category
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_user_role!
  # GET /posts or /posts.json
  def index
    
    if params[:category_id]

      @posts = Post.where(category_id: params[:category_id])
    else
      @posts = Post.all
    end
  end

  # GET /posts/1 or /posts/1.json
  def show
    @comments = @post.comments
    
  end

  # GET /posts/new
  def new
    @post = Post.new
    if user_signed_in?
      @current_user = current_user 
    end
  end

  # GET /posts/1/edit
  def edit
    if user_signed_in?
      @current_user = current_user 
    end
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))
   # @post.category << Category.find([])
    

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created.#{post_params}" }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if user_signed_in?
      @current_user = current_user 
    end
    respond_to do |format|
      if @post.update(post_params.merge(user_id: current_user.id))
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

   
    def post_params
      params.require(:post).permit(:title, :body, category_ids: [])
    end
    def set_category
      @categories = Category.all
    end

end
