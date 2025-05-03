class VerbConjugator
  include Latin

  def initialize(verb)
    @verb = verb
    @conjugation = verb.send(:conjugation)
    @stem = verb.send(:stem)
  end

  def forms
    MOODS.product(TENSES, VOICES).flat_map do |mood, tense, voice|
      endings = ENDINGS.dig(mood, tense, voice, @conjugation) || []

      endings.each_with_index.map do |ending, index|
        {
          text: @stem[tense] + ending,
          person: PERSONS[index % 3], # Cycles through first, second, third person
          number: NUMBERS[(index / 3) % 3], # Matches corresponding singular/plural number
          tense: tense.to_s,
          voice: voice.to_s,
          mood: mood.to_s,
          verb_id: @verb.id
        }
      end
    end
  end
end
