class AdminController < ApplicationController
  def login
    if request.post?
      user = User.authenticate(params[:name],params[:password])
      if user
        session[:user_id] = user.id
        redirect_to(:action => "index")
      else
        flash[:notice] = "Invalid user/password combination"
      end
    end
  end

  def logout


  end

  def index
    @total_orders = Order.count
  end

end
