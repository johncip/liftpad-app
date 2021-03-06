# == Schema Information
#
# Table name: workouts
#
#  id         :integer          not null, primary key
#  date       :datetime         not null
#  notes      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#  name       :string           default("New Workout"), not null
#

# A collection of Entries.
class Workout < ApplicationRecord
  belongs_to :user
  has_many :entries, -> { order(:order, :created_at) }

  # Returns the order value for a new entry, in sequence.
  def next_index
    (entries.pluck(:order).max || []) + 1
  end
end
