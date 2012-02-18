class ProductsController < ApplicationController
  respond_to :json, :html
  def index
    response = Product.paginate(params)
    @products = response.parsed_response
    headers.merge! response.headers
    respond_with @products
  end

  def show
    @product = Product.find(params[:id])
    respond_with @product
  end
end
