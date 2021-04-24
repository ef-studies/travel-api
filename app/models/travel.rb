class Travel < ApplicationRecord
  def month
    strftime('%m')
  end
end
