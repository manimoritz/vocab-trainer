module ApplicationHelper
  def conjugation_as_text(conjugation)
    conjugation.values.map { |concept| format_concept(concept) }.join(" ")
  end

  def random_conjugation
    {
      person: %i[first_person second_person third_person].sample,
      number: %i[singular plural].sample,
      tense: %i[present].sample,
      voice: %i[active].sample,
      mood: %i[indicative].sample
    }
  end

  private

    def format_concept(concept)
      case concept
      when :first_person then "First-Person"
      when :second_person then "Second-Person"
      when :third_person then "Third-Person"
      else concept.to_s.capitalize
      end
    end
end
