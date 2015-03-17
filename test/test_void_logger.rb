require 'minitest_helper'

class TestVoidLogger < Minitest::Test
  def setup
    @filepath = 'test/logfile.log'
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
end
