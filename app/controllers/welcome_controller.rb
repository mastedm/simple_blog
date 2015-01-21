class WelcomeController < ApplicationController
  include ApplicationHelper
  
  def index    
  end
  
  def category
    @category = Category.find_by_code params[:category]
  end
  
  def about
  end
end