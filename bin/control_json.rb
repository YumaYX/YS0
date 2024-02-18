# frozen_string_literal: true

require 'json'

data = JSON.parse(File.read('input/data.json'))

data.each_value do |value|
  puts value
end
