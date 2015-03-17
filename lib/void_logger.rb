require 'logger'

class VoidLogger < ::Logger
  VERSION = "0.0.1"

  def add(severity, message = nil, progname = nil, &block)
    return true
  end
end
