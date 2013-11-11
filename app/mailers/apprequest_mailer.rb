class ApprequestMailer < Devise::Mailer
  default from: "donotreply@jumpsquares.net"
  
  def user_request(admins, apptype_request)
    @requester = apptype_request.apprequestor
    @apprequestname = apptype_request.appname
    @apptype_request = apptype_request
    admins.each do |admin|
      mail(:to => admin.email, :subject => "New AppType Request")
    end
    
  end
  
  def admin_close(apptype_request)
    @requester = apptype_request.apprequestor
    @apprequestname = apptype_request.appname
    @apptype_request = apptype_request
    mail(:to => @apptype_request.apprequestor, :subject => "Your JumpSquare AppType Has Been Added")
  end
  
end
