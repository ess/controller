require 'syro'

require_relative 'apps/health_check'
require_relative 'apps/api'

Wrapp = Syro.new do
  on "healthz" do
    run HealthCheck::Application
  end

  on "readiness" do
    run HealthCheck::Application
  end

  run API::Application
end

Application = Rack::Builder.new do
  use Rack::MethodOverride

  run(Wrapp)
end
