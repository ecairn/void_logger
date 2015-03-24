require 'logger'

class VoidLogger < ::Logger
  VERSION = "0.0.1"

  def initialize(logdev=nil)
    super(logdev) unless logdev.nil?
  end

  def add(severity, message = nil, progname = nil, &block)
    return true
  end

  module Fallback
    def logger
      unless defined?(@_logger)
        @_logger = (super rescue nil) || VoidLogger.new
      end
      @_logger
    end
  end
end
