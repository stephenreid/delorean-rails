require 'test_helper'

module DeloreanTestBed
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
      assert_response :redirect
      assert_in_delta Time.now, DeloreanTestBed.cache.read(:start), 1.seconds
    end

    test 'POST #flux' do
      current_time = Time.now
      post :flux, { scale: 1000 }
      sleep(0.25)
      assert_response :redirect
      assert_equal 1000, DeloreanTestBed.cache.read(:scale).to_i
      refute_in_delta Time.now, current_time, 5.seconds
    end

    test 'POST #accelerate_to_eighty_eight' do
      Timecop.freeze
      current_time = Time.now
      post :accelerate_to_eighty_eight, { date: { year: 1.year.from_now.year , month: 1, day: 1, hour: 1, minute: 11 } }
      assert_response :redirect
      refute_in_delta Time.now, current_time, 10.seconds
    end
  end
end
