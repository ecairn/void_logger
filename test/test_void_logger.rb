require 'minitest_helper'
require 'logger'

LOG_FILE_NAME = 'test/logfile.log'
LOGGER = Logger.new LOG_FILE_NAME

class TestVoidLogger < Minitest::Test
  def setup
    @filepath = LOG_FILE_NAME
  end

  def teardown
    FileUtils.rm @filepath, force: true
  end

  def test_nothing_logged
    logger = VoidLogger.new(@filepath)
    logger.info "Should not be logged"

    string = File.read(@filepath)
    assert !string.include?("Should not be logged")
  end

  def test_logger_mixin
    b = B.new

    assert b.logger.is_a?(VoidLogger)

    b = B.new(true)
    assert_equal LOGGER, b.logger

    b.remove_logger
    b.reset_fallback_logger
    assert b.logger.is_a?(VoidLogger)

    b.logger = LOGGER
    assert_equal LOGGER, b.logger

    b.logger = nil
    assert b.logger.is_a?(VoidLogger)
  end
end

class A
  def initialize(log=false)
    if log
      self.class.send(:define_method, :logger) do
        LOGGER
      end
    end
  end

  def remove_logger
    self.class.send(:remove_method, :logger)
  end
end

class B < A
  include VoidLogger::LoggerMixin

  def initialize(log=false)
    super(log)
  end
end
