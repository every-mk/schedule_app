class Post < ApplicationRecord
  validates :title, presence: true, length: {maximum: 20}
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :all_day, inclusion: {in: [true, false]}
  validates :memorandum, length: {maximum: 500}

  validate :date_before_start
  validate :date_before_finish

  def date_before_start
    return if self.end_date.blank?
    errors.add(:end_date, "は今日以降の日付で選択してください") if self.end_date < Date.today
  end

  def date_before_finish
    return if self.start_date.blank? || self.end_date.blank?
    errors.add(:end_date, "は開始日以降の日付で選択してください") if self.start_date > self.end_date
  end
end
