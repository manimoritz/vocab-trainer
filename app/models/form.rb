class Form < ApplicationRecord
  belongs_to :verb

  validates :text, presence: true
end
