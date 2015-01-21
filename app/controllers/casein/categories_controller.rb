# Scaffolding generated by Casein v5.1.1.3

module Casein
  class CategoriesController < Casein::CaseinController
  
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]
  
    def index
      @casein_page_title = 'Categories'
  		@categories = Category.order(sort_order(:code)).paginate :page => params[:page]
    end
  
    def show
      @casein_page_title = 'View category'
      @category = Category.find params[:id]
    end
  
    def new
      @casein_page_title = 'Add a new category'
    	@category = Category.new
    end

    def create
      @category = Category.new category_params
    
      if @category.save
        flash[:notice] = 'Category created'
        redirect_to casein_categories_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new category'
        render :action => :new
      end
    end
  
    def update
      @casein_page_title = 'Update category'
      
      @category = Category.find params[:id]
    
      if @category.update_attributes category_params
        flash[:notice] = 'Category has been updated'
        redirect_to casein_categories_path
      else
        flash.now[:warning] = 'There were problems when trying to update this category'
        render :action => :show
      end
    end
 
    def destroy
      @category = Category.find params[:id]

      @category.destroy
      flash[:notice] = 'Category has been deleted'
      redirect_to casein_categories_path
    end
  
    private
      
      def category_params
        params.require(:category).permit(:code, :name, :show)
      end

  end
end