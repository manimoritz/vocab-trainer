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
    return 1 if present_infinitive[-3] == 'ā'
    return 2 if present_infinitive[-3] == 'ē'
    return 3.5 if present_infinitive[-3] == 'e' && present_active[-2..] == 'iō'
    return 3 if present_infinitive[-3] == 'e'
    return 4 if present_infinitive[-3] == 'ī'

    raise "'#{present_infinitive}' does not fit any conjugation rule."
  end

  def stem
    {
      present: {
        active: present_infinitive[..-4],
        passive: present_infinitive[..-4]
      },
      future: {
        active: [1, 3].include?(conjugation) ? present_active[..-2] : present_active[..-3],
        passive: [1, 3].include?(conjugation) ? present_active[..-2] : present_active[..-3]
      },
      imperfect: {
        active: [1, 3].include?(conjugation) ? present_active[..-2] : present_active[..-3],
        passive: [1, 3].include?(conjugation) ? present_active[..-2] : present_active[..-3]
      },
      perfect: {
        active: perfect_active[..-2],
        passive: supine
      },
      future_perfect: {
        active: perfect_active[..-2],
        passive: supine
      },
      pluperfect: {
        active: perfect_active[..-2],
        passive: supine
      }
    }
  end
end
