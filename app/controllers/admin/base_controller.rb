module Admin
  class BaseController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "1234"
  end
end
