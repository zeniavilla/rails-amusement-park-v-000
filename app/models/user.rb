class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  before_create :set_admin_default

  validates :admin, presence: false

  has_secure_password

  def mood
    if self.happiness > self.nausea
      "happy"
    else
      "sad"
    end
  end

  private

  def set_admin_default
    self.admin ||= 'false'
  end

end
