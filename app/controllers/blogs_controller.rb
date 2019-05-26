class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET /blogs
  def index
    @blogs = Blog.all
  end

  # GET /blogs/1
  def show
  end

  # GET /blogs/new
  def new
    #値が初期化されない戻るボタンを作成
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)
      if @blog.save
        redirect_to blogs_path, notice: 'Blog was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /blogs/1
  def update
      if @blog.update(blog_params)
        redirect_to blogs_path, notice: 'Blog was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
      redirect_to blogs_path, notice: 'Blog was successfully destroyed.'
  end

  def confirm
    @blog=Blog.new(blog_params)
    render:new if@blog.invalid?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
