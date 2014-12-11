class Task
  attr_reader :id

  class << self
    alias :queue :name

    def perform(id)
      puts "#{name}[#{id}] is about to do some work"
      new(id).do_now
    end
  end

  def initialize(id)
    @id = id
  end

  def do_later
    puts "#{self.class.name}[#{id}] will do some work later"
    Resque.enqueue(self.class, id)
  end

  def do_now
    raise RuntimeError.new('hey rocky watch me pull a bugsnag out of this resque worker') if ENV['RAISE_EXCEPTION']
  rescue ::Exception => e
    Bugsnag.notify_or_ignore(e, exception_meta_data)
    puts "#{self.class.name}[#{id}] is doing some work now"
  end

  def exception_meta_data
    {
      user_id: 1,
      company_id: 2
    }
  end
end
