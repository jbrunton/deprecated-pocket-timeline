class Timeline < ActiveRecord::Base
  has_and_belongs_to_many :events, join_table: :timeline_events
end
