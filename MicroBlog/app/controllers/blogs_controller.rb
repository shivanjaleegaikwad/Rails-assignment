class BlogsController < ApplicationController
  before_action :find_id, only: [:edit, :publish, :destroy]

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.friendly.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to @blog
    else
      render :new
    end
  end

  def edit; 
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render :edit
    end
  end

  def publish
    @blog.update(ispublished: !@blog.ispublished)
    redirect_to blog_path(@blog)
  end

  def destroy
    @blog.destroy
    redirect_to root_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body)
  end

  def find_id
    @blog = Blog.find_by(slug: params[:id])
  end
end
