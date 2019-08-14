require 'syro'

Wrapp = Syro.new do
end

Application = Rack::Builder.new do
  use Rack::MethodOverride

  run(Wrapp)
end
