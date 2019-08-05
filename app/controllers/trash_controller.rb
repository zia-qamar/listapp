class TrashController < ApplicationController
  include Restore
  def index
    @lists = List.trashed_items
    @dangling_list_items = []
    ListItem.trashed_items.map{|l| @dangling_list_items << l if !l.list.trashed?}
  end

  def restore
    @item = params[:type] == 'List' ? List.find(params[:id]): ListItem.find(params[:id])
    restore_item(@item)
    respond_to do |format|
      format.js { render('restore_' + params[:type].downcase) }
    end
  end
end
