class Api::V1::RubygemsController < Api::BaseController

  def create
    upload = Upload.new(params[:file].path)

    if upload.store!
      head 201
    else
      head 409
    end
  end

end
