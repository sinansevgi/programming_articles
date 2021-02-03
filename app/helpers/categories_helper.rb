module CategoriesHelper
  def render_partial(category)
    # Only render partial if category has an article
    render('category_part', category: category) if category.articles.last.present?
  end

  def get_image(category)
    image_show(category.articles.last) if category.articles.last.present?
  end

  def get_title(category)
    link_to(category.articles.last.title, article_path(category.articles.last)) if category.articles.last.present?
  end

  def render_featured
    render('featured') if Article.any?.present?
  end
end
