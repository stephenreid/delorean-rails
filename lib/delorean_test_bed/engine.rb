module DeloreanTestBed
  class Engine < ::Rails::Engine
    isolate_namespace DeloreanTestBed
    # initializer('delorean', after: :load_config_initializers) do |app|
    #   Rails.application.routes.prepend do
    #     mount DeloreanTestBed::Engine, at: '/delorean'
    #   end
    # end
  end
end
