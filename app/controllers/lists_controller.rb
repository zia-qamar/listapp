class ListsController < ApplicationController
  include Restore
  before_action :set_list, only: [:show, :edit, :update, :destroy, :trashed]

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.includes(:list_items).not_trashed
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
    render layout: false
  end

  # GET /lists/1/edit
  def edit
    render layout: false
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)
    respond_to do |format|
      if @list.save
        format.js { flash[:notice] = 'List has successfully been created' }
      else
        format.js { flash[:notice] = @list.errors.full_messages.first }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    @list.update(list_params)
    # respond_to do |format|
    #   if @list.update(list_params)
    #     format.html { redirect_to @list, notice: 'List was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @list }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @list.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    @item = @list.id
    respond_to do |format|
      if @list.destroy
        @removed = true
        format.js { flash[:notice] = 'List has successfully been destroyed' }
      else
        @removed = false
        format.js { flash[:notice] = 'Some error occurred' }
      end
    end
  end

  def trashed
    move_to_trash(@list)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:title, :trashed)
    end
end
