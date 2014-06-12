class CategoryController < ApplicationController
	def index
		@categories = Categories.all
	end

	def show
    	@category = Category.find(params[:id])
	end

	def new
		@category = Category.new
	end

	#def create
    #@article = Category.new(article_params)
     #   if @category.save
      #      format.html { redirect_to @category, notice: 'Category was successfully created.' }
       # end
    #end




        private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @article = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
