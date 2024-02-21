# frozen_string_literal: true

require 'csv'
require 'json'

# YS0
module YS0
  class << self
    def csv_to_hash(csv_file_name)
      result_hash = {}

      CSV.foreach(csv_file_name, 'rt', encoding: 'BOM|UTF-8', headers: true) do |row|
        key = row.headers.first
        values_hash = row.to_h
        result_hash[row[key]] = values_hash
      end

      result_hash
    end

    def csv_to_json(dir)
      target_files = Dir.glob(dir)
      target_files.map do |csv_file|
        json_file = csv_file.gsub(/.csv$/, '.json')
        content_hash = csv_to_hash(csv_file)

        File.write(json_file, JSON.dump(content_hash))
      end
    end
  end
end
