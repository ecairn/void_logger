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

  def test_fallback
    # ancestors: [TestFallbackClass1, TestFallbackModule1, VoidLogger::Fallback, Object, Minitest::Expectations, Kernel, BasicObject]
    t = TestFallbackClass1.new

    assert t.logger.is_a?(VoidLogger)

    # ancestors: [TestFallbackClass2, TestFallbackModule2, TestFallbackModule1, VoidLogger::Fallback, TestFallbackLogger, Object, Minitest::Expectations, Kernel, BasicObject]
    t = TestFallbackClass2.new

    assert_equal LOGGER, t.logger
  end
end

module TestFallbackModule1
  include VoidLogger::Fallback
end

class TestFallbackClass1
  include TestFallbackModule1
end

module TestFallbackLogger
  def logger
    LOGGER
  end
end

module TestFallbackModule2
  include TestFallbackLogger
  include VoidLogger::Fallback
  include TestFallbackModule1
end

class TestFallbackClass2
  include TestFallbackModule2
end
