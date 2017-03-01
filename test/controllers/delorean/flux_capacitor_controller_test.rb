require 'test_helper'

module Delorean
  class FluxCapacitorControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
    end

    teardown do
      Timecop.return
    end

    test 'GET #index' do
      get :index
      assert_response :success
    end

    test 'POST #start' do
      post :start
      assert_in_delta Time.now, session[:delorean_start_time], 1.seconds
    end

    test 'POST #flux' do
      current_time = Time.now
      post :flux, { scale: 1000 }
      sleep(0.25)
      assert_response :success
      assert_equal 1000, session[:delorean_scale].to_i
      refute_in_delta Time.now, current_time, 5.seconds
    end

    test 'POST #accelerate_to_eighty_eight' do
      post :flux, { date: { year: 2016, month: 1, day: 30, hour: 1, minute: 11 } }
      assert_response :success
      assert_equal Time.new("2016-01-30 1:11 -0500"), Time.new(session[:delorean_future])
      assert_in_delta Time.now, 2.days.ago, 1.seconds
    end
  end
end
