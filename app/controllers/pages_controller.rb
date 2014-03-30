class PagesController < ApplicationController
  skip_before_filter :require_user,  only: [:setup]
  skip_before_filter :require_setup, only: [:setup]

  def setup
    redirect_to rubygems_path if RequiredEnv.set?
  end
end
