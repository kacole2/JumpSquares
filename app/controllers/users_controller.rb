class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
   @jumpsizes = Jumpsize.find(:all, :conditions => { :jumpsizecreator => current_user.email })
   @users = User.paginate(:page => params[:page], :per_page => @jumpsizes.first.itemsperpage).search(params[:search]).find(:all, :order => sort_order('id'))
 #  @users = User.all
  end
  
  def makeadmin
    newadmin = User.find(params[:id])
    newadmin.add_role :admin
    redirect_to :back
  end
  
  def removeadmin
    removeadmin = User.find(params[:id])
    removeadmin.remove_role :admin
    redirect_to :back
  end
  
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
      @user = User.find(params[:id])
      
      @jumpsize = Jumpsize.find(:all, :conditions => { :jumpsizecreator => @user.email })
        @jumpsize.each do |j|
          j.destroy
        end
      
      @tag = Tag.find(:all, :conditions => { :tagcreator => @user.email })
        @tag.each do |t|
          t.destroy
        end
      
      @jumpsquare = Jumpsquare.find(:all, :conditions => { :jscreator => @user.email })
        @jumpsquare.each do |j|
          j.destroy
        end
        
      @user.destroy
      
      if current_user.has_role? :admin
        if @user.destroy
          redirect_to users_url, notice: @user.email + " and all associated data has been deleted."
        end
      else
        redirect_to :root, notice: @user.email + " and all associated data has been deleted."
      end
  end
  
  
  def show
    @user = User.find(params[:id])
  end

end
