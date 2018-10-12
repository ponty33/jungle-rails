class ReviewsController < ApplicationController
  def create
    @product = Product.find params[:product_id]
    @review = @product.reviews.new(rating_params)
    @review.user_id = current_user.id
    
    if @review.save
      redirect_to product_path(@product)
    else
      redirect_to product_path(@product)
    end
  end

  def rating_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    product = @review.product
    redirect_to product
  end

end
