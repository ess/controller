require 'timecop'

Before do
  Timecop.freeze(Time.utc(2019, 8, 16, 0, 8, 9))
end

After do
  Timecop.return
end
