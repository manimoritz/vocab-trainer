class Form < ApplicationRecord
  belongs_to :verb

  validates :text, :person, :number, :tense, :voice, :mood, :verb_id, presence: true

  def self.create_or_update!(attrs)
    form = find_or_initialize_by(attrs.except(:text))
    form.text = attrs[:text]
    form.save!
    form
  end
end
