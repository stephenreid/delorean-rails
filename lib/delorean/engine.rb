module Delorean
  class Engine < ::Rails::Engine
    isolate_namespace Delorean
    # initializer('delorean', after: :load_config_initializers) do |app|
    #   Rails.application.routes.prepend do
    #     mount Delorean::Engine, at: '/delorean'
    #   end
    # end
  end
end
