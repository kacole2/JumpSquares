class ApptypesController < ApplicationController
  before_action :set_apptype, only: [:show, :edit, :update, :destroy]
  # GET /apptypes
  # GET /apptypes.json
  def index
   @jumpsizes = Jumpsize.all
   #grabs the search function and displays it all by name
   @apptypes = Apptype.search(params[:search]).paginate(:page => params[:page], :per_page => @jumpsizes.first.itemsperpage).find(:all, :order => sort_order('lower(name)'))
  end
    
  # GET /apptypes/1
  # GET /apptypes/1.json
  def show
  end

  # GET /apptypes/new
  def new
    @apptype = Apptype.new
  end

  # GET /apptypes/1/edit
  def edit
  end

  # POST /apptypes
  # POST /apptypes.json
  def create
    @apptype = Apptype.new(apptype_params)

    respond_to do |format|
      if @apptype.save
        format.html { redirect_to @apptype, notice: 'Apptype was successfully created.' }
        format.json { render action: 'show', status: :created, location: @apptype }
      else
        format.html { render action: 'new' }
        format.json { render json: @apptype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apptypes/1 
  # PATCH/PUT /apptypes/1.json
  def update
    respond_to do |format|
      if @apptype.update(apptype_params)
        format.html { redirect_to @apptype, notice: 'Apptype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @apptype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apptypes/1
  # DELETE /apptypes/1.json
  def destroy

      @apptype.destroy
        respond_to do |format|
          format.html { redirect_to apptypes_url }
          format.json { head :no_content }
        end 
    
    
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apptype
      @apptype = Apptype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apptype_params
      params.require(:apptype).permit(:name, :image)
    end
   
end
