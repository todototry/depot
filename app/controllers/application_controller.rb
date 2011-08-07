class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout "store"

 # before_filter :authorize , :except => :login
  before_filter :set_locale

#  before_filter :authorize, :except => :login
  helper :all

  
  protected
  
  def authorize
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "Please log in"
      redirect_to :controller => 'admin', :action => 'login'
    end
  end

  def set_locale
    session[:locale] = params[:locale] if params[:locale]
    I18n.locale = session[:locale] || I18n.default_locale

    locale_path ="#{LOCALES_DIRECTORY}#{I18n.locale}.yml"

    unless I18n.load_path.include? locale_path
      I18n.load_path << locale_path
      I18n.backend.send(:init_translations)
    end

    rescue Exception => err
      logger.error err
      flash[:notice] = "#{I18n.locale} translation not available "

      I18n.load_path -= [locale_path]
      I18n.locale = session[:locale] = I18n.default_locale
    end


  end

    



