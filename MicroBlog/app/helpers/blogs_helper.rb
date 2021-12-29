module BlogsHelper
  def blog_status(blog)
    blog.ispublished ? 'Unpublish' : 'Publish'
  end
end
