class CreateJoinTableTimelineEvent < ActiveRecord::Migration
  def change
    create_join_table :events, :timelines, table_name: :timeline_events do |t|
      t.index [:timeline_id, :event_id], :unique => true
      t.index [:event_id, :timeline_id]
    end
  end
end
