class Alert < ActiveRecord::Base
  belongs_to :owner, class_name: 'river'
  validates :river_id, presence: true
end
