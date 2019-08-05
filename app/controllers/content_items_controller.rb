class ContentItemsController < ApplicationController
  include Restore
  before_action :set_item, only: [:show, :edit, :update, :destroy, :trashed]

  def index
    @lists = List.filter_deleted
    @dangling_list_items = []
    ListItem.filter_deleted.map{|l| @dangling_list_items << l if l.list.trashed?}
  end

  def show
  end

  def new
    @content_item = ContentItem.new
    render layout: false
  end

  def edit
    render layout: false
  end

  def create
    @content_item = ContentItem.new(item_params)
    respond_to do |format|
      if @content_item.save
        flash[:notice] = "#{@content_item.type} has successfully been created"
        format.js {render "create_#{@content_item.type.downcase}"}
      else
        flash[:notice] = @content_item.errors.full_messages.first
        format.js {render "create_#{@content_item.type.downcase}"}
      end
    end
  end

  def update
    item_type = @content_item.class.name == 'List' ? 'list' : 'list_item'
    @content_item.update(title: params[item_type][:title])
    respond_to do |format|
      flash[:notice] = "#{@content_item.type} has successfully been updated"
      format.js {render "update_#{@content_item.type.downcase}"}
    end
  end

  def destroy
    @item = @content_item.id
    respond_to do |format|
      if @content_item.destroy
        @removed = true
        flash[:notice] = "#{@content_item.type} has successfully been destroyed"
        format.js { render "destroy_#{@content_item.type.downcase}" }
      else
        @removed = false
        format.js { flash[:notice] = 'Some error occurred' }
      end
    end
  end

  def trashed
    move_to_trash(@content_item)
    respond_to do |format|
      flash[:notice] = "#{@content_item.type} has successfully been trashed"
      format.js {render "trashed_#{@content_item.type.downcase}"}
    end
  end

  private
  def set_item
    @content_item = ContentItem.find(params[:id])
  end

  def item_params
    params.require(:content_item).permit(:title, :trashed, :type, :parent_id)
  end
end
