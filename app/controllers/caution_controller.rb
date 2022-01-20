class CautionController < ApplicationController
  def index
    render status: 200, json: { status: 200, message: 'OK' }
  end
end
