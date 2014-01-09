class AdminDashboardController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource :class => false
  
  def admindashboard    
      @all_request_count = ApptypeRequest.all.count
      @open_requests_count = ApptypeRequest.where(:completed => false ).count
      @closed_requests_count = ApptypeRequest.where(:completed => true ).count   
      @apptypes_count = Apptype.all.count
      @jumpsquare_count = Jumpsquare.all.count  
      @tags_count = Tag.all.count   
      @users_count = User.all.count
      @admins = User.with_role :admin
      @admin_count = @admins.count
      @jumpsizes = Jumpsize.where(:jumpsizecreator => current_user.email )
      @users = User.search(params[:search]).paginate(:page => params[:page], :per_page => @jumpsizes.first.itemsperpage).order(sort_order('email'))
      @users_unconfirmed_count = User.where(:confirmed_at => nil ).count 
      @users_confirmed_count = @users.count.to_i - @users_unconfirmed_count 
      @jumpsquare_rdp_count = Jumpsquare.where(:remotetype => 'rdp' ).count
      @jumpsquare_ssh_count = Jumpsquare.where(:remotetype => 'ssh' ).count
      @jumpsquare_vnc_count = Jumpsquare.where(:remotetype => 'vnc' ).count
      @nmapxml_count = Nmapfile.all.count
      @nmapfiles = Nmapfile.all
      @nmaptotalrecord_count = 0
      @nmapmissingrecord_count = 0
      @nmapfiles.each do |nmapfile|
        @nmaptotalrecord_count = nmapfile.nmapfilerecords.to_i + @nmaptotalrecord_count
        @nmapmissingrecord_count = nmapfile.nmapfilematches.to_i + @nmapmissingrecord_count
      end
    end

end
