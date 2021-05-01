class Travel < ApplicationRecord
  scope :planning_travel, -> { where('departure_date > ?', Time.current.beginning_of_day) }

  def month
    strftime('%m')
  end
end
