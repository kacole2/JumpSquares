class JumpsquaresController < ApplicationController
  before_action :set_jumpsquare, only: [:show, :edit, :update, :destroy]
  before_action :load_jumpsquare, only: :create
  
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /jumpsquares
  # GET /jumpsquares.json
  def index
   @tags = Tag.find(:all, :conditions => { :tagcreator => current_user.email })
   @jumpsizes = Jumpsize.find(:all, :conditions => { :jumpsizecreator => current_user.email })
  
   if current_user.has_role? :admin
      #uncomment to see ALL jumpsquares
      #@jumpsquares = Jumpsquare.paginate(:page => params[:page], :per_page => @jumpsizes.first.itemsperpage).search(params[:search]).find(:all, :order => sort_order('name'))
      @jumpsquares = Jumpsquare.paginate(:page => params[:page], :per_page => @jumpsizes.first.itemsperpage).search(params[:search]).find(:all, :conditions => { :jscreator => current_user.email }, :order => sort_order('name'))
    else
      @jumpsquares = Jumpsquare.paginate(:page => params[:page], :per_page => @jumpsizes.first.itemsperpage).search(params[:search]).find(:all, :conditions => { :jscreator => current_user.email }, :order => sort_order('name'))
    end 

  end
  
  # GET /jumpsquares/1
  # GET /jumpsquares/1.json
  def show
    @jumpsizes = Jumpsize.find(:all, :conditions => { :jumpsizecreator => current_user.email })
  end

  # GET /jumpsquares/new
  def new
    @jumpsquare = Jumpsquare.new
    @tags = Tag.find(:all, :conditions => { :tagcreator => current_user.email })
    @jumpsizes = Jumpsize.find(:all, :conditions => { :jumpsizecreator => current_user.email })
  end

  # GET /jumpsquares/1/edit
  def edit
  end

  # POST /jumpsquares
  # POST /jumpsquares.json
  def create
    @jumpsquare = Jumpsquare.new(jumpsquare_params)
    
    
    @tags = Tag.where(:id => params[:tag])
    @jumpsquare.tags << @tags 
    
    respond_to do |format|
      if @jumpsquare.save
        format.html { redirect_to @jumpsquare, notice: 'JumpSquare was successfully created.' }
        format.json { render action: 'show', status: :created, location: @jumpsquare }
      else
        format.html { render action: 'new' }
        format.json { render json: @jumpsquare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jumpsquares/1
  # PATCH/PUT /jumpsquares/1.json
  def update
    
    #params[:jumpsquare][:tag_ids] ||= []
    #params.require(:jumpsquare).permit(:tagname, :tag_ids => [])
    
    @jumpsquare = Jumpsquare.find(params[:id])
    @tags = Tag.where(:id => params[:tag])
    @jumpsquare.tags.destroy_all   #disassociate the already added organizers
    @jumpsquare.tags << @tags 
    
    respond_to do |format|
      if @jumpsquare.update(jumpsquare_params)
        format.html { redirect_to @jumpsquare, notice: 'JumpSquare was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @jumpsquare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jumpsquares/1
  # DELETE /jumpsquares/1.json
  def destroy
    @jumpsquare.destroy
    respond_to do |format|
      format.html { redirect_to jumpsquares_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jumpsquare
      @jumpsquare = Jumpsquare.find(params[:id])
    end
    
    def load_jumpsquare
      @jumpsquare = Jumpsquare.new(jumpsquare_params)
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def jumpsquare_params
      params.require(:jumpsquare).permit(:name, :apptype, :url, :ipordns, :description, :tag, :jscreator)
    end

end
