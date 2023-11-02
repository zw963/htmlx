module Archiver
  enum Status
    Waiting
    Running
    Complete
  end

  class_property status = Status::Waiting

  # 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0
  class_property progress = 0.0

  extend self

  def run
    if status.waiting?
      self.status = Status::Running
      self.progress = 0.0
      spawn run_impl
    end
  end

  def run_impl
    10.times do |i|
      sleep rand

      return unless status.running?

      self.progress = (i + 1)/10.0
      puts "Here...#{progress}"
    end

    sleep 1

    return unless status.running?

    self.status = Status::Complete
  end

  def archive_file
    "contacts.json"
  end

  def reset
    self.status = Status::Waiting
  end
end
