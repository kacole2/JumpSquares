class JumpsizesController < ApplicationController
  before_action :set_jumpsize, only: [:show, :edit, :update, :destroy]   

  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /jumpsizes
  # GET /jumpsizes.json
  def index
    if current_user.has_role? :admin
      @jumpsizes = Jumpsize.paginate(:page => params[:page], :per_page => 100).search(params[:search]).find(:all, :order => sort_order('id'))
    else
      @jumpsizes = Jumpsize.find(:all, :conditions => { :jumpsizecreator => current_user.email })
    end
    
  end

  # GET /jumpsizes/1
  # GET /jumpsizes/1.json
  def show
  end

  # GET /jumpsizes/new
  def new
    @jumpsize = Jumpsize.new
  end

  # GET /jumpsizes/1/edit
  def edit
  end

  # POST /jumpsizes
  # POST /jumpsizes.json
  def create
    @jumpsize = Jumpsize.new(jumpsize_params)

    respond_to do |format|
      if @jumpsize.save
        format.html { redirect_to @jumpsize, notice: 'Jumpsize was successfully created.' }
        format.json { render action: 'show', status: :created, location: @jumpsize }
      else
        format.html { render action: 'new' }
        format.json { render json: @jumpsize.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jumpsizes/1
  # PATCH/PUT /jumpsizes/1.json
  def update
    respond_to do |format|
      if @jumpsize.update(jumpsize_params)
        format.html { redirect_to @jumpsize, notice: 'Jumpsize was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @jumpsize.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jumpsizes/1
  # DELETE /jumpsizes/1.json
  def destroy
    @jumpsize.destroy
    respond_to do |format|
      format.html { redirect_to jumpsizes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jumpsize
      @jumpsize = Jumpsize.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jumpsize_params
      params.require(:jumpsize).permit(:size, :length1, :length2, :itemsperpage, :jumpsizecreator)
    end
end
