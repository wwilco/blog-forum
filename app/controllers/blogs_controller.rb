class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(blog_params)
    redirect_to @blog
  end

  def show
    @blog = Blog.find_by(id: params[:id])
  end

  def destroy
    @blog = Blog.find_by(id: params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  def edit
    @blog = Blog.find_by(id: params[:id])
  end

  def update
    @blog = Blog.find_by(id: params[:id])
    @blog.update_attributes(blog_params)
    redirect_to @blog
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

end
