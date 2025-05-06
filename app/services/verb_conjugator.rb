class VerbConjugator
  include Latin

  def initialize(verb)
    @verb = verb
    @conjugation = verb.send(:conjugation)
    @stem = verb.send(:stem)
  end

  def forms
    MOODS.product(VOICES, TENSES).flat_map do |mood, voice, tense|
      endings = ENDINGS.dig(mood, tense, voice, @conjugation) || []

      endings.each_with_index.map do |ending, index|
        {
          text: @stem[tense][voice] + ending,
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
