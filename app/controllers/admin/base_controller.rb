module Admin
  class BaseController < ApplicationController
    http_basic_authenticate_with name: ENV['ADMIN_ID'], password: ENV['ADMIN_PASSWORD']
  end
end
