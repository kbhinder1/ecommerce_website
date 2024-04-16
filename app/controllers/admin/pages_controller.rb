class Admin::PagesController < ApplicationController
 def edit
  @page = Page.find_or_initialize_by(title: params[:title])
  end

 def edit
  @page = Page.find_or_initialize_by(title: params[:title])
  end
end

private

def page_params
  params.require(:page).permit(:title, :content)
end