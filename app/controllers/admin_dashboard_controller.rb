class AdminDashboardController < ApplicationController



  
  def admindashboard
      
      
      
      
      @apptypes_count = Apptype.all.count
      @jumpsquare_count = Jumpsquare.all.count    
      @tags_count = Tag.all.count   
      
      
      
      
      
      
      
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

