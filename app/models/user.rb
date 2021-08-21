class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :company
  has_many :applicants

 after_create :send_welcome_mail

  private

  #TODO use background jobs
  def send_welcome_mail
    UserMailer.welcome(self).deliver_now
  end
end
