class AdminDashboardController < ApplicationController



  
  def admindashboard
      
      
      
      
      @apptypes_count = Apptype.count(:all)    
      @jumpsquare_count = Jumpsquare.count(:all)    
      @tags_count = Tag.count(:all)   
      
      
      
      
      
      
      
      
    end

end

