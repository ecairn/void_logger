require 'logger'

class VoidLogger < ::Logger
  VERSION = "0.1"

  def initialize(logdev=nil)
    super(logdev)
  end

  def add(severity, message = nil, progname = nil, &block)
    return true
  end

  module LoggerMixin

    attr_writer :logger
    attr_reader :fallback_logger

    def logger
      @fallback_logger ||= (super rescue nil) || VoidLogger.new
      @logger || @fallback_logger
    end

    def reset_fallback_logger
      @fallback_logger = nil
    end
  end
end
