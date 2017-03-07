require_dependency "delorean_test_bed/application_controller"

module DeloreanTestBed
  class FluxCapacitorController < ApplicationController
    def index
      @scale = DeloreanTestBed::cache.read(:future).to_i
    end

    def start
      DeloreanTestBed::cache.write(:start, Time.now)
      Timecop.return
      redirect_to root_path
    end

    def pause
      DeloreanTestBed::cache.write(:pause, Time.now)
      Timecop.freeze(DeloreanTestBed::cache.read(:pause))
      redirect_to root_path
    end

    def flux
      DeloreanTestBed::cache.write(:scale, params[:scale])
      Timecop.scale(params[:scale].to_i)
      redirect_to root_path
    end

    def accelerate_to_eighty_eight
      DeloreanTestBed::cache.write(:future, DateTime.new(
        *params[:date].values.map(&:to_i)
      ))
      Timecop.travel(DeloreanTestBed::cache.read(:future))
      redirect_to root_path
    end
  end
end
