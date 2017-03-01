require_dependency "delorean/application_controller"

module Delorean
  class FluxCapacitorController < ApplicationController
    def index
      @scale = session[:delorean_scale].to_i
    end

    def start
      session[:delorean_start_time] = Time.now
      Timecop.return
      redirect_to root_path
    end

    def pause
      session[:delorean_pause_time] = Time.now
      Timecop.freeze(session[:delorean_pause_time])
      redirect_to root_path
    end

    def flux
      session[:delorean_scale] = params[:scale]
      Timecop.scale(params[:scale].to_i)
      puts Time.now
      puts Time.now
      redirect_to root_path
    end

    def accelerate_to_eighty_eight
      puts params[:date]
      session[:delorean_future] = DateTime.new(
        *params[:date].values.map(&:to_i)
      )
      Timecop.travel(session[:delorean_future])
      redirect_to root_path
    end
  end
end
