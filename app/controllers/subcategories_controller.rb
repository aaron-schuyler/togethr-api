class SubcategoriesController < ApplicationController
  def index
    subcategories = Subcategory.all
    options = {}
    options[:is_collection] = true
    render json: SubcategorySerializer.new(subcategories, options).serializable_hash[:data]
  end
  def show
    subcategory = Subcategory.find(params[:id])
    options = {}
    options[:is_collection] = true
    render json: {id: subcategory[:id], name: subcategory[:name], skills: SkillSerializer.new(subcategory.skills, options).serializable_hash[:data]}
  end
end
