# frozen_string_literal: true

# YS0
module YS0; end

Dir.glob("#{__dir__}/*/*.rb").sort.each { |lib| require(lib) }
