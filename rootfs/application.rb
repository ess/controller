require 'syro'

require_relative 'apps/health_check'

Wrapp = Syro.new do
  on "healthz" do
    run HealthCheck::Application
  end
end

Application = Rack::Builder.new do
  use Rack::MethodOverride

  run(Wrapp)
end
