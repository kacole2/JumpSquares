class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper 
  

  def after_sign_in_path_for(user)
    jumpsquares_path
  end

  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Sorry, but you do not have permission. Access denied."
    redirect_to :userroot
  end

  private
  #called to sort the table. taking in case insensitive  
    def sort_order(default)
      sort_col = (params[:c] || default.to_s).gsub(/[\s;'\"]/,'')
      sort_col += "::text" if ActiveRecord::Base.connection.class.to_s.match(/PostgreSQLAdapter$/)
      "LOWER( #{sort_col} ) #{params[:d] == 'down' ? 'DESC' : 'ASC'}"
    end
  
end
