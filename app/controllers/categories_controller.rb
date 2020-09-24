class CategoriesController < ApplicationController
  def index
    categories = Category.all
    options = {}
    options[:is_collection] = true
    render json: CategorySerializer.new(categories, options).serializable_hash[:data]
  end
  def show
    category = Category.find(params[:id])
    options = {}
    options[:is_collection] = true
    render json: {id: category[:id], name: category[:name], subcategories: SubcategorySerializer.new(category.subcategories, options).serializable_hash[:data]}
  end
end
