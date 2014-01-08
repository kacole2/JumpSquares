class NmapfilesController < ApplicationController
  before_action :set_nmapfile, only: [:show, :update, :destroy]

  # GET /nmapfiles
  # GET /nmapfiles.json
  def index
    @jumpsquares = Jumpsquare.all
    @jumpsizes = Jumpsize.all
    #@nmapfiles = Nmapfile.all
    @nmapfiles = Nmapfile.search(params[:search]).paginate(:page => params[:page], :per_page => @jumpsizes.first.itemsperpage).find(:all, :order => sort_order('lower(nmapfilename)'))
  end

  # GET /nmapfiles/1
  # GET /nmapfiles/1.json
  def show
  end

  # GET /nmapfiles/new
  def new
    @nmapfile = Nmapfile.new
  end

  # GET /nmapfiles/1/edit
  def edit
  end

  # POST /nmapfiles
  # POST /nmapfiles.json
  def create
    @nmapfile = Nmapfile.new(nmapfile_params)
   
    respond_to do |format|
      if @nmapfile.save
        format.html { redirect_to @nmapfile, notice: 'nmap file was successfully created.' }
        format.json { render action: 'show', status: :created, location: @nmapfile }
      else
        format.html { render action: 'new' }
        format.json { render json: @nmapfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nmapfiles/1
  # PATCH/PUT /nmapfiles/1.json
  def update
    respond_to do |format|
      if @nmapfile.update(nmapfile_params)
        format.html { redirect_to @nmapfile, notice: 'Nmapfile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @nmapfile.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /nmapfiles/1
  # DELETE /nmapfiles/1.json
  def destroy
    @nmapfile.remove_nmapxml!
    FileUtils.remove_dir("#{Rails.root}/public/uploads/nmapfile/nmapxml/#{@nmapfile.id}", :force => true)
    @nmapfile.destroy
    respond_to do |format|
      format.html { redirect_to nmapfiles_url }
      format.json { head :no_content }
    end
  end
  
  def xmlviewer
    @jumpsquares = Jumpsquare.all
    @nmapfile = Nmapfile.find(params[:nmapfile_id])
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nmapfile
      @nmapfile = Nmapfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nmapfile_params
      params.require(:nmapfile).permit(:nmapfilename, :nmapfilerecords, :nmapfilematches, :nmapxml)
    end
end
