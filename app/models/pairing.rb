class Pairing < ActiveRecord::Base
  belongs_to :user
  belongs_to :pair, class_name: "User", foreign_key: :partner_id

  validate :date_cannot_be_in_the_future
  validates :date, presence: true

  def self.pairing_date(user, pair)
    result1 = where(user_id: user, partner_id: pair).first
    result2 = where(user_id: pair, partner_id: user).first
    if result1
      result1.date
    elsif result2
      result2.date
    end
  end

  def date_cannot_be_in_the_future
    errors.add(:base, "You cannot choose a date in the future") if !date.blank? and date > Date.today
  end

end