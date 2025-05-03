class Verb < ApplicationRecord
  has_many :forms, dependent: :destroy

  validates :present_active, presence: true
  validates :present_infinitive, presence: true, uniqueness: true
  validates :perfect_active, presence: true
  validates :supine, presence: true

  def self.not_learned_yet
    # TODO: Replace this placeholder logic with some learning system similar to Anki.
    Verb.all
  end

  def conjugation_list
    VerbConjugator.new(self).forms
  end

  private

  def conjugation
    return 1 if present_infinitive[-3] == 'ã'
    return 2 if present_infinitive[-3] == 'ẽ'
    return 3.5 if present_infinitive[-3] == 'e' && present_active[-2..] == 'iõ'
    return 3 if present_infinitive[-3] == 'e'
    return 4 if present_infinitive[-3] == 'ĩ'

    raise "'#{present_infinitive}' does not fit any conjugation rule."
  end

  def stem
    {
      present: present_infinitive[..-4],
      future: [1, 3].include?(conjugation) ? present_active[..-2] : present_active[..-3],
      imperfect: [1, 3].include?(conjugation) ? present_active[..-2] : present_active[..-3],
      perfect: perfect_active[..-2],
      future_perfect: perfect_active[..-2],
      pluperfect: perfect_active[..-2]
    }
  end
end
