class Event < ActiveRecord::Base
  validates :title, presence: true
  validate :date, presense: true
end
