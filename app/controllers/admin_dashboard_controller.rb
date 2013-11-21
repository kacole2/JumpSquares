class AdminDashboardController < ApplicationController



  
  def admindashboard
      
      
      
      
      @apptypes_count = Apptype.count(:all)    
      @jumpsquare_count = Jumpsquare.count(:all)    
      @tags_count = Tag.count(:all)   
      
      
      
      
      
      
      
      @jumpsquare_rdp_count = Jumpsquare.count(:all, :conditions => { :remotetype => 'rpd' })
      @jumpsquare_ssh_count = Jumpsquare.count(:all, :conditions => { :remotetype => 'ssh' })
      @jumpsquare_vnc_count = Jumpsquare.count(:all, :conditions => { :remotetype => 'vnc' })
    end

end

