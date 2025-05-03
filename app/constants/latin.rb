module Latin
  PERSONS = %i[first_person second_person third_person].freeze
  NUMBERS = %i[singular plural].freeze
  TENSES = %i[present future imperfect perfect future_perfect pluperfect].freeze
  VOICES = %i[active passive].freeze
  MOODS = %i[indicative subjunctive].freeze

  ENDINGS = {
    indicative: {
      present: {
        active: {
          1 => %w[õ ãs at ãmus ãtis ant],   # First conjugation
          2 => %w[eõ ẽs et ẽmus ẽtis ent],  # Second conjugation
          3 => %w[õ is it imus itis unt],   # Third conjugation
          3.5 => %w[iõ is it imus itis iunt], # Third -iō conjugation
          4 => %w[iõ ĩs it ĩmus ĩtis iunt] # Fourth conjugation
        },
        passive: {
          1 => %w[or ãris ãtur ãmur ãminĩ antur],
          2 => %w[eor ẽris ẽtur ẽmur ẽminĩ entur],
          3 => %w[or eris itur imur iminĩ untur],
          3.5 => %w[ior eris itur imur iminĩ iuntur],
          4 => %w[ior ĩris ĩtur ĩmur ĩminĩ iuntur]
        }
      },
      future: {
        active: {
          1 => %w[ãbõ ãbis ãbit ãbimus ãbitis ãbunt],
          2 => %w[bõ bis bit bimus bitis bunt],
          3 => %w[am ẽs et ẽmus ẽtis ent],
          3.5 => %w[iam iẽs iet iẽmus iẽtis ient],
          4 => %w[iam iẽs iet iẽmus iẽtis ient]
        },
        passive: {
          1 => %w[bor beris bitur bimur biminĩ buntur],
          2 => %w[bor beris bitur bimur biminĩ buntur],
          3 => %w[ar ẽris ẽtur ẽmur ẽminĩ entur],
          3.5 => %w[ar ẽris ẽtur ẽmur ẽminĩ entur],
          4 => %w[ar ẽris ẽtur ẽmur ẽminĩ entur]
        }
      },
      imperfect: {
        active: {
          1 => %w[ãbam ãbãs ãbat ãbãmus ãbãtis ãbant],
          2 => %w[bam bãs bat bãmus bãtis bant],
          3 => %w[bam bãs bat bãmus bãtis bant],
          3.5 => %w[bam bãs bat bãmus bãtis bant],
          4 => %w[bam bãs bat bãmus bãtis bant]
        },
        passive: Hash.new(%w[bar bãris bãtur bãmur bãminĩ bantur])
      },
      perfect: {
        active: Hash.new(%w[ĩ istĩ it imus istis ẽrunt]),
        passive: Hash.new([' sum', ' es', ' est', ' sumus', ' estis', ' sunt'])
      },
      future_perfect: {
        active: Hash.new(%w[erõ eris erit erimus eritis erint]),
        passive: Hash.new([' erõ', ' eris', ' erit', ' erimus', ' eritis', ' erunt'])
      },
      pluperfect: {
        active: Hash.new(%w[eram erãs erat erãmus erãtis erant]),
        passive: Hash.new([' eram', ' erãs', ' erat', ' erãmus', ' erãtis', ' erant'])
      }
    },
    subjunctive: {
      present: {
        active: Hash.new(%w[am ãs at ãmus ãtis ant]).merge({ 1 => %w[em ẽs et ẽmus ẽtis ent] }),
        passive: Hash.new(%w[ar ãris ãtur ãmur ãminĩ antur]).merge({ 1 => %w[er ẽris ẽtur ẽmur ẽminĩ entur] })
      },
      imperfect: {
        active: Hash.new(%w[em ẽs et ẽmus ẽtis ent]),
        passive: Hash.new(%w[er ẽris ẽtur ẽmur ẽminĩ entur])
      },
      perfect: {
        active: Hash.new(%w[erim erĩs erit erĩmus erĩtis erint]),
        passive: Hash.new([' sim', ' sĩs', ' sit', ' sĩmus', ' sĩtis', ' sint'])
      },
      pluperfect: {
        active: Hash.new(%w[ssem ssẽs sset ssẽmus ssẽtis ssent]),
        passive: Hash.new([' essem', ' essẽs', ' esset', ' essẽmus', ' essẽtis', ' essent'])
      }
    }
  }.freeze
end
