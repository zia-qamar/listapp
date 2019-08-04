class TrashController < ApplicationController
  include Restore
  def index
    @lists = List.includes(:list_items).trashed
  end

  def restore
    @item = params[:type] == 'List' ? List.find(params[:id]): ListItem.find(params[:id])
    restore_item(@item)
    respond_to do |format|
      format.js { render ('restore_' + params[:type].downcase) }
    end
  end
end
