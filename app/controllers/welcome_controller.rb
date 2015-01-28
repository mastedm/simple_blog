class WelcomeController < ApplicationController
  include ApplicationHelper
  
  def index    
  end
  
  def category
    @category = Category.find_by_code params[:category]
    
    @articles = {
      :last_article => @category.articles.last,
      :others => @category.articles
    }
  end
  
  def article
    @article = Article.find params[:id]
  end
  
  def about
  end
end