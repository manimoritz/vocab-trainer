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
    # Establish logic for the distinction between conjugations.
    forms_for_i_conjugation
  end

  private

    def forms_for_i_conjugation
      present_stem = present_infinitive[..-4]
      present_forms = present_forms_for_fourth_conjugation(first_person)

      imperfect_stem = "#{present_active[..-2]}ẽ"
      imperfect_forms = imperfect_forms_for_i_conjugation(imperfect_stem)

      future_stem = "#{present_active[..-2]}"
      future_forms = future_forms_for_i_conjugation(future_stem)

      perfect_stem = perfect_active[..-2]
      perfect_forms = perfect_forms_for_i_conjugation(perfect_stem)

      pluperfect_forms = pluperfect_forms_for_i_conjugation(perfect_stem)

      future_perfect_forms = perfect_forms_for_i_conjugation(perfect_stem)
    end

    # First conjugation.

    def forms_for_conjugation(tense)
      persons = %i[first_person second_person third_person]
      numbers = %i[singular singular singular plural plural plural]

      selected_endings = endings[tense][conjugation_type] || []

      forms = selected_endings.each_with_index.map do |ending, index|
        {
          text: stem[tense] + ending,
          person: persons[index % 3], # Cycles through first, second, third person
          number: numbers[index], # Matches corresponding singular/plural number
          tense: "present",
          voice: "active",
          mood: "indicative",
          verb_id: id
        }
      end

      forms
    end

    def stem
      {
        present => present_infinitive[..-4]
        # TODO: Implement other tenses.
      }
    end

    def endings
      endings = {
        indicative => {
          present => {
            active => {
              1 => %w[õ ãs at ãmus ãtis ant],   # First conjugation
              2 => %w[eõ ẽs et ẽmus ẽtis ent],  # Second conjugation
              3 => %w[õ is it imus itis unt],   # Third conjugation
              3.5 => %w[iõ is it imus itis iunt], # Third -iō conjugation
              4 => %w[iõ ĩs it ĩmus ĩtis iunt]  # Fourth conjugation
            },
            passive => {
              1 => %w[or ãris ãtur ãmur ãminĩ antur],
              2 => %w[eor ẽris ẽtur ẽmur ẽminĩ entur],
              3 => %w[or eris itur imur iminĩ untur],
              3.5 => %w[ior eris itur imur iminĩ iuntur],
              4 => %w[ior ĩris ĩtur ĩmur ĩminĩ iuntur]
            }
          },
          future => {
            active => {
              1 => %w[bõ bis bit bimus bitis bunt],
              2 => %w[bõ bis bit bimus bitis bunt],
              3 => %w[am ẽs et ẽmus ẽtis ent],
              3.5 => %w[iam iẽs iet iẽmus iẽtis ient],
              4 => %w[iam iẽs iet iẽmus iẽtis ient]
            },
            passive => {
              1 => %w[bor beris bitur bimur biminĩ buntur],
              2 => %w[bor beris bitur bimur biminĩ buntur],
              3 => %w[ar ẽris ẽtur ẽmur ẽminĩ entur],
              3.5 => %w[ar ẽris ẽtur ẽmur ẽminĩ entur],
              4 => %w[ar ẽris ẽtur ẽmur ẽminĩ entur]
            }
          },
          imperfect => {
            active: Hash.new(%w[bam bãs bat bãmus bãtis bant]),
            passive: Hash.new(%w[bar bãris bãtur bãmur bãminĩ bantur])
          },
          perfect => {
            active: Hash.new(%w[ĩ istĩ it imus istis ẽrunt]),
            passive: Hash.new([ " sum", " es", " est", " sumus", " estis", " sunt" ])
          },
          future_perfect => {
            active: Hash.new(%w[erõ eris erit erimus eritis erint]),
            passive: Hash.new([ " erõ", " eris", " erit", " erimus", " eritis", " erunt" ])
          },
          pluperfect => {
            active: Hash.new(%w[eram erãs erat erãmus erãtis erant]),
            passive: Hash.new([ " eram", " erãs", " erat", " erãmus", " erãtis", " erant" ])
          }
        },
        subjunctive => {
          present => {
            active: Hash.new(%w[am ãs at ãmus ãtis ant]).merge({
                1 => %w[em ẽs et ẽmus ẽtis ent]
            }),
            passive: Hash.new(%w[ar ãris ãtur ãmur ãminĩ antur]).merge({
                1 => %w[er ẽris ẽtur ẽmur ẽminĩ entur]
            })
          },
          imperfect => {
            active: Hash.new(%w[em ẽs et ẽmus ẽtis ent]),
            passive: Hash.new(%w[er ẽris ẽtur ẽmur ẽminĩ entur])
          },
          perfect => {
            active: Hash.new(%w[erim erĩs erit erĩmus erĩtis erint]),
            passive: Hash.new([ " sim", " sĩs", " sit", " sĩmus", " sĩtis", " sint" ])
          },
          pluperfect => {
            active: Hash.new(%w[ssem ssẽs sset ssẽmus ssẽtis ssent]),
            passive: Hash.new([ " essem", " essẽs", " esset", " essẽmus", " essẽtis", " essent" ])
          }
        }
      }
    end

    def present_forms_for_first_conjugation
      stem = present_infinitive[..-4]
      active_indicative = [ present_active, "#{stem}ãs",   "#{stem}at",   "#{stem}ãmus", "#{stem}ãtis",  "#{stem}ant" ]
      active_subjunctive = [  "#{stem}em",  "#{stem}ẽs",   "#{stem}et",   "#{stem}ẽmus", "#{stem}ẽtis",  "#{stem}ent" ]
      passive_indicative = [  "#{stem}or",  "#{stem}ãris", "#{stem}ãtur", "#{stem}ãmur", "#{stem}ãminĩ", "#{stem}antur" ]
      passive_subjunctive = [ "#{stem}er",  "#{stem}ẽris", "#{stem}ẽtur", "#{stem}ẽmur", "#{stem}ẽminĩ", "#{stem}entur" ]
      [ active_indicative, active_subjunctive, passive_indicative, passive_subjunctive ]
    end

    def imperfect_forms_for_first_conjugation
      stem = present_infinitive[..-4]
      active_indicative = [   "#{stem}ãbam", "#{stem}ãbãs",   "#{stem}ãbat",   "#{stem}ãbãmus", "#{stem}ãbãtis",  "#{stem}ãbant" ]
      active_subjunctive = [  "#{stem}ãrem", "#{stem}ãrẽs",   "#{stem}ãret",   "#{stem}ãrẽmus", "#{stem}ãrẽtis",  "#{stem}ãrent" ]
      passive_indicative = [  "#{stem}ãbar", "#{stem}ãbãris", "#{stem}ãbãtur", "#{stem}ãbãmur", "#{stem}ãbãminĩ", "#{stem}ãbantur" ]
      passive_subjunctive = [ "#{stem}ãrer", "#{stem}ãrẽris", "#{stem}ãrẽtur", "#{stem}ãrẽmur", "#{stem}ãrẽminĩ", "#{stem}ãrentur" ]
      [ active_indicative, active_subjunctive, passive_indicative, passive_subjunctive ]
    end

    def future_forms_for_first_conjugation
      stem = present_infinitive[..-4]
      active_indicative = [  "#{stem}ãbõ",  "#{stem}ãbis",   "#{stem}ãbit",   "#{stem}ãbimus", "#{stem}ãbitis",  "#{stem}ãbunt" ]
      passive_indicative = [ "#{stem}ãbor", "#{stem}ãberis", "#{stem}ãbitur", "#{stem}ãbimur", "#{stem}ãbiminĩ", "#{stem}ãbuntur" ]
      [ active_indicative, active_subjunctive ]
    end

    def perfect_forms_for_first_conjugation
      stem = perfect_active[..-1]
      active_indicative = [ perfect_active,  "#{stem}istĩ",   "#{stem}it",   "#{stem}imus", "#{stem}istis",  "#{stem}ẽrunt" ]
      active_subjunctive = [  "#{stem}erim", "#{stem}erĩs",   "#{stem}erit",   "#{stem}erĩmus", "#{stem}erĩtis",  "#{stem}erint" ]
      stem = "#{supine[..-2]}us"
      passive_indicative = [  "#{stem} sum", "#{stem} es",  "#{stem} est", "#{stem} sumus", "#{stem} estis", "#{stem} sunt" ]
      passive_subjunctive = [ "#{stem} sim", "#{stem} sĩs", "#{stem} sit", "#{stem} sĩmus", "#{stem} sĩtis", "#{stem} sint" ]
    end

    def pluperfect_forms_for_first_conjugation
      stem = perfect_active[..-1]
      active_indicative = [ "#{stem}eram",   "#{stem}erãs",  "#{stem}erat",  "#{stem}erãmus",  "#{stem}erãtis",  "#{stem}erant" ]
      active_subjunctive = [ "#{stem}issem", "#{stem}issẽs", "#{stem}isset", "#{stem}issẽmus", "#{stem}issẽtis", "#{stem}issent" ]
      stem = "#{supine[..-2]}us"
      passive_indicative = [  "#{stem} eram", "#{stem} erãs",  "#{stem} erat", "#{stem} erãmus", "#{stem} erãtis", "#{stem} erant" ]
      passive_subjunctive = [ "#{stem} essem", "#{stem} essẽs", "#{stem} esset", "#{stem} essẽmus", "#{stem} essẽtis", "#{stem} essent" ]
    end

    # Second conjugation.

    def present_forms_for_second_conjugation
      stem = present_infinitive[..-4]
      active_indicative[present_active, "#{stem}ẽs", "#{stem}et", "#{stem}ẽmus", "#{stem}ẽtis", "#{stem}ent"]
      active_subjunctive["#{stem}eam", "#{stem}eãs", "#{stem}eat", "#{stem}eãmus", "#{stem}eãtis", "#{stem}eant"]
      passive_indicative["#{stem}eor", "#{stem}ẽris", "#{stem}ẽtur", "#{stem}ẽmur", "#{stem}ẽminĩ", "#{stem}entur"]
      passive_subjunctive["#{stem}ear", "#{stem}eãris", "#{stem}eãtur", "#{stem}eãmur", "#{stem}eãminĩ", "#{stem}eantur"]
      [ active_indicative, active_subjunctive, passive_indicative, passive_subjunctive ]
    end

    def present_forms_for_third_conjugation
      stem = present_infinitive[..-4]
      active_indicative[present_active, "#{stem}is", "#{stem}it", "#{stem}imus", "#{stem}itis", "#{stem}unt"]
      active_subjunctive["#{stem}am", "#{stem}ãs", "#{stem}at", "#{stem}ãmus", "#{stem}ãtis", "#{stem}ant"]
      passive_indicative["#{stem}or", "#{stem}eris", "#{stem}itur", "#{stem}imur", "#{stem}iminĩ", "#{stem}untur"]
      passive_subjunctive["#{stem}ar", "#{stem}ãris", "#{stem}ãtur", "#{stem}ãmur", "#{stem}ãminĩ", "#{stem}antur"]
      [ active_indicative, active_subjunctive, passive_indicative, passive_subjunctive ]
    end

    def present_forms_for_fourth_conjugation
      stem = present_infinitive[..-4]
      active_indicative[present_active, "#{stem}ĩs", "#{stem}it", "#{stem}ĩmus", "#{stem}ĩtis", "#{stem}iunt"]
      active_subjunctive["#{stem}iam", "#{stem}iãs", "#{stem}iat", "#{stem}iãmus", "#{stem}iãtis", "#{stem}iant"]
      passive_indicative["#{stem}ior", "#{stem}ĩris", "#{stem}itur", "#{stem}ĩmur", "#{stem}ĩminĩ", "#{stem}iuntur"]
      passive_subjunctive["#{stem}iar", "#{stem}iãris", "#{stem}iãtur", "#{stem}iãmur", "#{stem}iãminĩ", "#{stem}iantur"]
      [ active_indicative, active_subjunctive, passive_indicative, passive_subjunctive ]
    end

    def imperfect_forms_for_i_conjugation(stem)
      active_indicative = [ "#{stem}bam", "#{stem}bãs", "#{stem}bat", "#{stem}bãmus", "#{stem}bãtis", "#{stem}bant" ]
    end

    def future_forms_for_i_conjugation(stem)
      [ "#{stem}am", "#{stem}ẽs", "#{stem}et", "#{stem}ẽmus", "#{stem}ẽtis", "#{stem}ent" ]
    end

    def perfect_forms_for_i_conjugation(stem)
      [ perfect_active, "#{stem}istĩ", "#{stem}it", "#{stem}imus", "#{stem}istis", "#{stem}ẽrunt" ]
    end

    def pluperfect_forms_for_i_conjugation(stem)
      [ "#{stem}erõ", "#{stem}eris", "#{stem}erit", "#{stem}erimus", "#{stem}eritis", "#{stem}erint" ]
    end
end
