class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @page_title = %w[Categories]
  end

  def show
    @category   = Category.find_by(slug: params[:id])
    @page_title = ['Categories', @category.name]
  end
end
