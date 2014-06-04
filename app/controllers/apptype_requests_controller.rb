class ApptypeRequestsController < ApplicationController
  before_action :set_apptype_request, only: [:show, :edit, :update, :destroy]
  before_action :load_apptype_request, only: :create
  
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /apptype_requests
  # GET /apptype_requests.json
  def index
    @jumpsizes = Jumpsize.where(:jumpsizecreator => current_user.email) 
 
      if current_user.has_role? :admin
        @apptype_requests = ApptypeRequest.search(params[:search]).paginate(:page => params[:page], :per_page => @jumpsizes.first.itemsperpage).order(sort_order('completed'))
      else
        @apptype_requests = ApptypeRequest.search(params[:search]).paginate(:page => params[:page], :per_page => @jumpsizes.first.itemsperpage).where(:apprequestor => current_user.email).order(sort_order('completed'))
      end
  end

  # GET /apptype_requests/1
  # GET /apptype_requests/1.json
  def show
  end

  # GET /apptype_requests/new
  def new
    @apptype_request = ApptypeRequest.new
  end

  # GET /apptype_requests/1/edit
  def edit
  end

  # POST /apptype_requests
  # POST /apptype_requests.json
  def create
    
    @apptype_request = ApptypeRequest.new(apptype_request_params)
    @apptype_request.apprequestor = current_user.email
    @apptype_request.completed = false
    
    @admins = User.with_role :admin
    ApprequestMailer.user_request(@admins, @apptype_request).deliver
    
    respond_to do |format|
      if @apptype_request.save
        format.html { redirect_to @apptype_request, notice: 'Apptype request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @apptype_request }
      else
        flash[:notice] = "That AppType already exists. Go Search for it."
        format.html { render action: 'new', notice: 'That AppType already exists. Go Search for it.' }
        format.json { render json: @apptype_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apptype_requests/1
  # PATCH/PUT /apptype_requests/1.json
  def update
    respond_to do |format|
      
      if @apptype_request.update(apptype_request_params)
        format.html { redirect_to @apptype_request, notice: 'Apptype request was successfully updated.' }
        format.json { head :no_content }
          
         if @apptype_request.completed = true
           ApprequestMailer.admin_close(@apptype_request).deliver
         end
         
      else
        format.html { render action: 'edit' }
        format.json { render json: @apptype_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apptype_requests/1
  # DELETE /apptype_requests/1.json
  def destroy
    @apptype_request.destroy
    respond_to do |format|
      format.html { redirect_to apptype_requests_url }
      format.json { head :no_content }
    end
  end

  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apptype_request
      @apptype_request = ApptypeRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apptype_request_params
      params.require(:apptype_request).permit(:appname, :imageurl, :apprequestor, :completed)
    end
    
    def load_apptype_request
      @apptype_request = ApptypeRequest.new(apptype_request_params)
    end
    
end
