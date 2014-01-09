class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  before_action :load_tag, only: :create
  
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /tags
  # GET /tags.json
  def index 
    @jumpsizes = Jumpsize.where(:jumpsizecreator => current_user.email)
    if current_user.has_role? :admin
      @tags = Tag.search(params[:search]).paginate(:page => params[:page], :per_page => @jumpsizes.first.itemsperpage).order(sort_order('tagname'))
    else
      @tags = Tag.search(params[:search]).paginate(:page => params[:page], :per_page => @jumpsizes.first.itemsperpage).where(:tagcreator => current_user.email)
    end
  end
  
  # GET /tags/1
  # GET /tags/1.json
  def show   
    @jumpsizes = Jumpsize.where(:jumpsizecreator => current_user.email)
    @jumpsquares = Jumpsquare.search(params[:search]).paginate(:page => params[:page], :per_page => @jumpsizes.first.itemsperpage).where(:jscreator => current_user.email).order(sort_order('name'))
    if current_user.has_role? :admin
      @tags = Tag.where(:tagcreator => current_user.email)
    else
      @tags = Tag.where(:tagcreator => current_user.email)
    end
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tag }
      else
        format.html { render action: 'new' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end
    
    def load_tag
      @tag = Tag.new(tag_params)
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:tagname, :tagcreator)
    end
    
end
