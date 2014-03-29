class SessionsController < ApplicationController

  skip_before_filter :require_user

  def new ; end

  def create
    render text: auth_hash.to_yaml
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
