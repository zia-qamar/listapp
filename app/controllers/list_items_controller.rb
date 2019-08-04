class ListItemsController < ApplicationController
  before_action :set_list_item, only: [:show, :edit, :update, :destroy]

  # GET /list_items
  # GET /list_items.json
  def index
    @list_items = ListItem.all
  end

  # GET /list_items/1
  # GET /list_items/1.json
  def show
  end

  # GET /list_items/new
  def new
    @list_item = ListItem.new(list_id: params[:list_id])
    render layout: false
  end

  # GET /list_items/1/edit
  def edit
    render layout: false
  end

  # POST /list_items
  # POST /list_items.json
  def create
    @list_item = ListItem.new(list_item_params)
    respond_to do |format|
      if @list_item.save
        format.js { flash[:notice] = 'Item has successfully been created' }
      else
        @removed = false
        format.js { flash[:notice] = 'Some error occured' }
      end
    end
  end

  # PATCH/PUT /list_items/1
  # PATCH/PUT /list_items/1.json
  def update
    @list_item.update(list_item_params)
    # respond_to do |format|
    #   if @list_item.update(list_item_params)
    #     format.html { redirect_to @list_item, notice: 'List item was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @list_item }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @list_item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /list_items/1
  # DELETE /list_items/1.json
  def destroy
    @item = @list_item.id
    respond_to do |format|
      if @list_item.destroy
        @removed = true
        format.js { flash[:notice] = 'Item has successfully been destroyed' }
      else
        @removed = false
        format.js { flash[:notice] = 'Some error occured' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_item
      @list_item = ListItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_item_params
      params.require(:list_item).permit(:title, :trashed, :list_id)
    end
end
