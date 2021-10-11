DEFAULT_INTERVALS = [0, 5, 30, 1440, 7200]

class Box < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :slots, dependent: :destroy
  validates :name, presence: true
  validates :language, presence: true

  after_create do
    5.times do |num|
      quiz_type = [0, 1, 2].include?(num) ? 'choose' : 'choose-reverse'
      Slot.create(box: self, order: num + 1, quiztype: quiz_type, interval: DEFAULT_INTERVALS[num])
    end
  end
end
