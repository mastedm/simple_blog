# Scaffolding generated by Casein v5.1.1.3

module Casein
  class ArticlesController < Casein::CaseinController
  
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]
  
    def index
      @casein_page_title = 'Articles'
  		@articles = Article.order(sort_order(:title)).paginate :page => params[:page]
    end
  
    def show
      @casein_page_title = 'View article'
      @article = Article.find params[:id]
    end
  
    def new
      @casein_page_title = 'Add a new article'
    	@article = Article.new
    end

    def create
      @article = Article.new article_params
    
      if @article.save
        flash[:notice] = 'Article created'
        redirect_to casein_articles_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new article'
        render :action => :new
      end
    end
  
    def update
      @casein_page_title = 'Update article'
      
      @article = Article.find params[:id]
    
      if @article.update_attributes article_params
        flash[:notice] = 'Article has been updated'
        redirect_to casein_articles_path
      else
        flash.now[:warning] = 'There were problems when trying to update this article'
        render :action => :show
      end
    end
 
    def destroy
      @article = Article.find params[:id]

      @article.destroy
      flash[:notice] = 'Article has been deleted'
      redirect_to casein_articles_path
    end
  
    private
      
      def article_params
        params.require(:article).permit(:title, :text, :image)
      end

  end
end