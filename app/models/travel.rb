class Travel < ApplicationRecord
  validates :destination, :departure_date, :return_date, :departure_date, presence: true
  # TO DO validação dos campos de data

  scope :planning_travels, -> { where('departure_date > ?', today) }
  scope :travelling, -> { where('departure_date < ? and return_date > ?', today, today) }
  scope :finished_travels, -> { where('return_date < ?', today) }
  scope :with_locale, ->(locale) { where('origin = ? or destination = ?', locale, locale) }
  scope :all_by_month, ->(month) {
    where("cast(strftime('%m', departure_date) as int) = ? or cast(strftime('%m', return_date) as int) = ?", month, month) }

  private

  def today
    Time.current.beginning_of_day
  end
end
