require 'resque'

class MyJob
  @queue = :my_queue

  def self.perform(param)
    puts(param)
  end
end