#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './../lib/ys0'

target_glob = 'input/*.csv'
File.dirname(target_glob)

Dir.glob(target_glob).map { |csv_file| YS0.csv_to_json(csv_file) }
