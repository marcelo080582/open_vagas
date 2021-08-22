require 'csv'

class Applicant < ApplicationRecord
  belongs_to :user
  belongs_to :position
  has_one_attached :resume

  validates :name, :email, :phone, :resume, presence: true

  validate :resume_mime_type

  def self.as_csv
    attributes = %w[id name email phone]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |applicant|
        csv << attributes.map { |attr| applicant.send(attr) }
      end
    end
  end

  private

  def resume_mime_type
    if resume.attached? && !resume.content_type.in?('application/pdf')
      errors.add(:resume, 'inválido. Favor, enviar somente PDF.')
    end
  end
end
