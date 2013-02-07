# -*- encoding: utf-8 -*-
class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :nickname_required

  helper_method :current_user

  private

  def transaction(&block)
    ActiveRecord::Base.transaction do
      yield
    end
  end

  def render_404
    render :file => "#{Rails.root}/public/404", :formats => [:html], :status => 404
  end

  def nickname_required
    if current_user.present? and current_user.nickname.nil?
      redirect_to edit_user_path(current_user)
    end
  end

  def login_required
    if current_user.blank?
      redirect_to root_path(:return_to => request.url)
    end
  end

  def current_user
    begin
      session[:user_id].present? ? User.find(session[:user_id]) : nil
    rescue Exception => e
      Rails.logger.debug e
      reset_session
      nil
    end
  end

end
