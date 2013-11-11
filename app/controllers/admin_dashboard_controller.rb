class AdminDashboardController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource :class => false
  
  def admindashboard
      
      @all_request_count = ApptypeRequest.count(:all)
      @open_requests_count = ApptypeRequest.count(:all, :conditions => { :completed => false })
      @closed_requests_count = ApptypeRequest.count(:all, :conditions => { :completed => true })   
      @apptypes_count = Apptype.count(:all)    
      @jumpsquare_count = Jumpsquare.count(:all)    
      @tags_count = Tag.count(:all)   
      @users_count = User.count(:all)
      @admins = User.with_role :admin
      @admin_count = @admins.count
      @jumpsizes = Jumpsize.find(:all, :conditions => { :jumpsizecreator => current_user.email })
      @users = User.paginate(:page => params[:page], :per_page => @jumpsizes.first.itemsperpage).search(params[:search]).find(:all, :order => sort_order('email'))
      @users_unconfirmed_count = User.count(:all, :conditions => { :confirmed_at => nil }) 
      @users_confirmed_count = @users.count.to_i - @users_unconfirmed_count
      
    end

end
