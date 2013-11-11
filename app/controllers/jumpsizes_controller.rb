class JumpsizesController < ApplicationController
  before_action :set_jumpsize, only: [:show, :edit, :update, :destroy]   

  # GET /jumpsizes
  # GET /jumpsizes.json
  def index
    @jumpsizes = Jumpsize.all
  end

  # GET /jumpsizes/1
  # GET /jumpsizes/1.json
  def show
  end

  # GET /jumpsizes/new
  # NO MORE NEW SIZES
  #def new
  #  @jumpsize = Jumpsize.new
  #end

  # GET /jumpsizes/1/edit
  def edit
  end

  # POST /jumpsizes
  # POST /jumpsizes.json
  # NO MORE NEW ONES
=begin
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
=end

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
  # DON'T BE STUPID AND DELETE THIS
=begin  
  def destroy
    @jumpsize.destroy
    respond_to do |format|
      format.html { redirect_to jumpsizes_url }
      format.json { head :no_content }
    end
  end
=end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jumpsize
      @jumpsize = Jumpsize.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jumpsize_params
      params.require(:jumpsize).permit(:size, :length1, :length2, :itemsperpage)
    end
end
