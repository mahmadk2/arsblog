class CategoriesController < ApplicationController
before_action :logged_in, except: [:index, :show]

before_action :require_admin, only: [:create, :edit, :destroy ]

def index
@categories = Category.paginate(page: params[:page], per_page:3)
end

def new
@category = Category.new
	end

def create
@category = Category.new(category_params)

if @category.save

	flash[:success]='category create successfully'
	redirect_to categories_path

else

	render 'new'

end
end
def edit 
@category = Category.find(params[:id])
end

def update
@category = Category.find(params[:id])
if @category.update(category_params)
	flash[:success] = "edit category successfully"
	redirect_to category_path(@category)
else
	render 'edit'
	end
end
def show
 @category = Category.find(params[:id])
 @category_articles = @category.articles.paginate(page: params[:page], per_page: 3)
	end


private
def category_params
params.require(:category).permit(:name)
end

def logged_in

	if !signed_in?

		flash[:danger] = "Did not do this actions without Signed-in"
		redirect_to categories_path
	end
end

    def require_admin

if signed_in? and  !current_user.admin? 

flash[:danger] = "Only admin users can do that"

redirect_to root_path

end

end

end