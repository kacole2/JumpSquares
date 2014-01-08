class AdminDashboardController < ApplicationController



  
  def admindashboard
      
      
      
      
      @apptypes_count = Apptype.count(:all)    
      @jumpsquare_count = Jumpsquare.count(:all)    
      @tags_count = Tag.count(:all)   
      
      
      
      
      
      
      
      @jumpsquare_rdp_count = Jumpsquare.count(:all, :conditions => { :remotetype => 'rdp' })
      @jumpsquare_ssh_count = Jumpsquare.count(:all, :conditions => { :remotetype => 'ssh' })
      @jumpsquare_vnc_count = Jumpsquare.count(:all, :conditions => { :remotetype => 'vnc' })
      @nmapxml_count = Nmapfile.count(:all)
      @nmapfiles = Nmapfile.all
      @nmaptotalrecord_count = 0
      @nmapmissingrecord_count = 0
      @nmapfiles.each do |nmapfile|
        @nmaptotalrecord_count = nmapfile.nmapfilerecords.to_i + @nmaptotalrecord_count
        @nmapmissingrecord_count = nmapfile.nmapfilematches.to_i + @nmapmissingrecord_count
      end
    end

end

