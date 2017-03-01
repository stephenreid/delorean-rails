require 'test_helper'

module Delorean
  class FluxCapacitorControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
    end

    test 'shows index' do
      get :index
      assert_response :success
    end
  end
end
