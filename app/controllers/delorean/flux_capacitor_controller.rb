require_dependency "delorean/application_controller"

module Delorean
  class FluxCapacitorController < ApplicationController
    def index
      @scale = Delorean::cache.read(:future).to_i
    end

    def start
      Delorean::cache.write(:start, Time.now)
      Timecop.return
      redirect_to root_path
    end

    def pause
      Delorean::cache.write(:pause, Time.now)
      Timecop.freeze(Delorean::cache.read(:pause))
      redirect_to root_path
    end

    def flux
      Delorean::cache.write(:scale, params[:scale])
      Timecop.scale(params[:scale].to_i)
      redirect_to root_path
    end

    def accelerate_to_eighty_eight
      Delorean::cache.write(:future, DateTime.new(
        *params[:date].values.map(&:to_i)
      ))
      Timecop.travel(Delorean::cache.read(:future))
      redirect_to root_path
    end
  end
end
