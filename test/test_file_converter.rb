# frozen_string_literal: true

require_relative 'helper'
require 'json'

class TestFileConverter < Minitest::Test
  def setup
    @expect = {
      'Ruby' => { 'name' => 'Ruby', 'id' => '0' },
      'Python' => { 'name' => 'Python', 'id' => '1' }
    }
  end

  def teardown; end

  def test_csv_to_hash
    assert_equal(@expect, YS0.csv_to_hash('testdata/csv_to_json.csv'))
  end

  def test_csv_to_json
    dir = 'testdata/*.csv'
    Dir.glob(dir).map do |csv_file|
      YS0.csv_to_json(csv_file)
      json_file = csv_file.gsub(/.csv$/, '.json')
      assert_equal(@expect, JSON.parse(File.read(json_file)))
    end
  end
end
