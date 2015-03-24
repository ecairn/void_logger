require 'logger'

class VoidLogger < ::Logger
  VERSION = "0.1"

  def initialize(logdev=nil)
    super(logdev) unless logdev.nil?
  end

  def add(severity, message = nil, progname = nil, &block)
    return true
  end

  module LoggerMixin

    attr_writer :logger
    attr_reader :fallback

    def logger
      @fallback ||= (super rescue nil) || VoidLogger.new
      @logger || @fallback
    end

    def reset_fallback
      @fallback = nil
    end
  end
end
