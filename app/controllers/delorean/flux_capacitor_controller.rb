require_dependency "delorean/application_controller"

module Delorean
  class FluxCapacitorController < ApplicationController
    def index
    end

    def start
      Time.now
      redirect_to root_path
    end

    def pause
      Timecop.freeze
      redirect_to root_path
    end

    def flux
      Timecop.scale(params[:scale])
      redirect_to root_path
    end

    def accelerate_to_eighty_eight
      Timecop.freeze(params[:future])
      redirect_to root_path
    end
  end
end
