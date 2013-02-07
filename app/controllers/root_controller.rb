# -*- encoding: utf-8 -*-
class RootController < ApplicationController

  respond_to :html

  def index
    @gists = Gist.limit(5).recent
    @return_to = params[:return_to] 
  end

end
