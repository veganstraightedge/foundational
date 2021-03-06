class TagsController < ApplicationController
  def index
    @tags       = Tag.all
    @page_title = %w[Tags]
  end

  def show
    @tag        = Tag.find_by(slug: params[:id])
    @page_title = ['Tags', @tag.name]
  end
end
