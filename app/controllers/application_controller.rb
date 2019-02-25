# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery except: :sign_in
  protect_from_forgery with: :null_session
end
