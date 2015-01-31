class WelcomeController < ApplicationController
  include ApplicationHelper
  
  def index    
  end
  
  def category
    @category = Category.find_by_code params[:category]
    @articles = @category.articles.order('created_at desc')
  end
  
  def article
    @article = Article.find params[:id]
  end
  
  def about
  end
end