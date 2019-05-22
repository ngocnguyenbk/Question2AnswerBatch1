class WorkExperience < ApplicationRecord
  belongs_to :user
  validates :description,  presence: true, length: { maximum: 100 }
  validates :start_time, presence: true
  validate :end_date_after_start_date, if -> { end_time.presence && start_time.presence }

  def end_date_after_start_date
    if end_time < start_time
      errors.add :end_time, "Must be after start date"
    end
  end
end
