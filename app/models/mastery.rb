class Mastery < ApplicationRecord
  belongs_to :user

  def calculate(quality)
    if quality >= 3
      case repetitions
      when 0
        self.interval = 1
      when 1
        self.interval = 6
      else
        self.interval = interval * ease
      end
      self.repetitions += 1
      self.ease = ease + (0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02))
    else
      self.repetitions = 0
      self.interval = 1
    end

    self.ease = 1.3 if ease < 1.3
    self.next_test = Time.zone.now + interval.day
  end
end
