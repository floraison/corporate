
Dir[File.join(__dir__, 'initializers', '*.rb')]
  .sort
  .each { |pa| require(pa) }

