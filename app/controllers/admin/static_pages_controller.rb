# app/controllers/admin/static_pages_controller.rb
class Admin::StaticPagesController < ApplicationController
   
    before_action :set_static_page, only: [:edit, :update]
    
    # GET /admin/static_pages/:id/edit
    def edit
      # code for edit action
    end
    
    # PATCH/PUT /admin/static_pages/:id
    def update
      puts params.inspect
      if @static_page.update(static_page_params)
        redirect_to edit_admin_static_page_path(@static_page), notice: 'Page was successfully updated.'
      else
        render :edit
      end
    end

    private

    def set_static_page
      @static_page = StaticPage.find(params[:id])
      end

    def static_page_params
      params.require(:static_page).permit(:title, :content)
    end
  end

