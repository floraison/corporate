
module Corporate::Cases; end

Dir[File.join(__dir__, 'cases', '*.rb')].each { |pa| require(pa) }

