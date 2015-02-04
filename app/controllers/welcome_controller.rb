class WelcomeController < ApplicationController
  include ApplicationHelper
  
  before_filter :set_title
  
  def index
    @articles = Article.last(10)    
  end
  
  def category
    @category = Category.find_by_code params[:category]
    @articles = @category.articles.order('created_at desc')
    
    @title = @category.name + ' - ' + @title
  end
  
  def article
    @article = Article.find params[:id]
    @title = @article.title + ' - ' + @article.category.name + ' - ' + @title
  end
  
  def about
  end
  
  private 
  
  def set_title
    @title = setting(:site_name)
  end
end