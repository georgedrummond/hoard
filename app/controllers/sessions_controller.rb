class SessionsController < ApplicationController

  skip_before_filter :require_user

  def new ; end

  def create
    client = Octokit::Client.new(access_token: auth_hash.credentials.token)
    organization_ids = client.organizations.map { |org| org.login  }

    if organization_ids.include?(ENV['GITHUB_ORGANIZATION_NAME'])
      user = User.find_or_create_by(email: auth_hash.info.email)
      user.update_attributes(
        nickname: auth_hash.info.nickname,
        name: auth_hash.info.name,
        avatar_url: auth_hash.info.image,
        github_id: auth_hash.uid,
        github_token: auth_hash.credentials.token
      )

      session[:user_id] = user.id
      redirect_to rubygems_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
