=begin
Alyssa has been assigned a task of modifying a class that was initially created 
to keep track of secret information. The new requirement calls for adding 
logging, when clients of the class attempt to access the secret data. Here is 
the class in its current form:


She needs to modify it so that any access to data must result in a log entry 
being generated. That is, any call to the class which will result in data being 
returned must first call a logging class. The logging class has been supplied 
to Alyssa and looks like the following:

Hint: Assume that you can modify the initialize method in SecretFile to have an 
instance of SecurityLogger be passed in as an additional argument. It may be 
helpful to review the lecture on collaborator objects for this practice problem.
=end

require 'date'

class SecretFile
  def initialize(secret_data, logger)
    @data = secret_data
    @logger = logger
  end

  def data
    details = {
      date: DateTime.now,
      user: "hacker1337"
    }
    logger.create_log_entry(details)
    puts "Agent 47 dispatched to your location. Do not attempt to resist."
    @data
  end

  def display_log
    logger.display
  end

  private

  attr_reader :logger
end

class SecurityLogger
  def initialize
    @log = []
  end

  def create_log_entry(details)
    log << details
  end

  def display
    log.each { |l| puts l}
  end

  private

  attr_reader :log
end

nuke_codes = SecretFile.new("42", SecurityLogger.new)
puts nuke_codes.data
sleep 1
puts nuke_codes.data
sleep 1
puts nuke_codes.data
nuke_codes.display_log