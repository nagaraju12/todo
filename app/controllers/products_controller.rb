class ProductsController < ApplicationController
	def index
		@products= Product.all
	end

	def new
		@product= Product.new
	end
def load_subcat
  @category = Category.find(params[:category_id])
  @sub_categories = @category.sub_categories
   flash[:error] = "Error is arised"
  respond_to do |format|
    format.js
  end
end

  def create
  	@product= Product.new(product_params)
  	if @product.save
  		redirect_to @product
  	else
  		render 'new'
  	end
  end
def show
	@product= Product.find(params[:id])
end
def edit
	@product= Product.find(params[:id])
end
def update
	@product= Product.find(params[:id])
	if@product.update(product_params)
		redirect_to @product
	else
		reder 'edit'
	end
end

def destroy
	@product= Product.find(params[:id])
	@product.destroy
	redirect_to products_path
end

private
def product_params
	params.require(:product).permit(:name,:category_id, :sub_category_id, :discription, :price, :photo)
end

end
