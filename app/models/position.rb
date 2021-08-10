class Position < ApplicationRecord
  belongs_to :company
  has_rich_text :description

  enum career: [:developer, :business_inteligence, :information_technology, :design,
                :product, :technology, :other]
  enum contract: [:clt, :pj, :match]

  validates :name, :career, :contract, :city, :state, :summary, presence: true
end
