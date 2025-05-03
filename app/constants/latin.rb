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
          1 => %w[ō ās at āmus ātis ant],   # First conjugation
          2 => %w[eō ēs et ēmus ētis ent],  # Second conjugation
          3 => %w[ō is it imus itis unt],   # Third conjugation
          3.5 => %w[iō is it imus itis iunt], # Third -iō conjugation
          4 => %w[iō īs it īmus ītis iunt] # Fourth conjugation
        },
        passive: {
          1 => %w[or āris ātur āmur āminī antur],
          2 => %w[eor ēris ētur ēmur ēminī entur],
          3 => %w[or eris itur imur iminī untur],
          3.5 => %w[ior eris itur imur iminī iuntur],
          4 => %w[ior īris ītur īmur īminī iuntur]
        }
      },
      future: {
        active: {
          1 => %w[ābō ābis ābit ābimus ābitis ābunt],
          2 => %w[ēbō ēbis ēbit ēbimus ēbitis ēbunt],
          3 => %w[am ēs et ēmus ētis ent],
          3.5 => %w[iam iēs iet iēmus iētis ient],
          4 => %w[iam iēs iet iēmus iētis ient]
        },
        passive: {
          1 => %w[ābor āberis ābitur ābimur ābiminī ābuntur],
          2 => %w[bor beris bitur bimur biminī buntur],
          3 => %w[ar ēris ētur ēmur ēminī entur],
          3.5 => %w[ar ēris ētur ēmur ēminī entur],
          4 => %w[ar ēris ētur ēmur ēminī entur]
        }
      },
      imperfect: {
        active: {
          1 => %w[ābam ābās ābat ābāmus ābātis ābant],
          2 => %w[ēbam ēbās ēbat ēbāmus ēbātis ēbant],
          3 => %w[ēbam ēbās ēbat ēbāmus ēbātis ēbant],
          3.5 => %w[iēbam iēbās iēbat iēbāmus iēbātis iēbant],
          4 => %w[iēbam iēbās iēbat iēbāmus iēbātis iēbant]
        },
        passive: {
          1 => %w[ābar ābāris ābātur ābāmur ābāminī ābantur],
          2 => %w[ēbar ēbāris ēbātur ēbāmur ēbāminī ēbantur],
          3 => %w[ēbar ēbāris ēbātur ēbāmur ēbāminī ēbantur],
          3.5 => %w[iēbar iēbāris iēbātur iēbāmur iēbāminī iēbantur],
          4 => %w[iēbar iēbāris iēbātur iēbāmur iēbāminī iēbantur]
        }
      },
      perfect: {
        active: Hash.new(%w[ī istī it imus istis ērunt]),
        passive: Hash.new([' sum', ' es', ' est', ' sumus', ' estis', ' sunt'])
      },
      future_perfect: {
        active: Hash.new(%w[erō eris erit erimus eritis erint]),
        passive: Hash.new([' erō', ' eris', ' erit', ' erimus', ' eritis', ' erunt'])
      },
      pluperfect: {
        active: Hash.new(%w[eram erās erat erāmus erātis erant]),
        passive: Hash.new([' eram', ' erās', ' erat', ' erāmus', ' erātis', ' erant'])
      }
    },
    subjunctive: {
      present: {
        active: Hash.new(%w[am ās at āmus ātis ant]).merge({ 1 => %w[em ēs et ēmus ētis ent] }),
        passive: Hash.new(%w[ar āris ātur āmur āminī antur]).merge({ 1 => %w[er ēris ētur ēmur ēminī entur] })
      },
      imperfect: {
        active: {
          1 => %w[ārem ārēs āret ārēmus ārētis ārent],
          2 => %w[em ēs et ēmus ētis ent],
          3 => %w[em ēs et ēmus ētis ent],
          3.5 => %w[em ēs et ēmus ētis ent],
          4 => %w[em ēs et ēmus ētis ent]
        },
        passive: {
          1 => %w[ārer ārēris ārētur ārēmur ārēminī ārentur],
          2 => %w[er ēris ētur ēmur ēminī entur],
          3 => %w[er ēris ētur ēmur ēminī entur],
          3.5 => %w[er ēris ētur ēmur ēminī entur],
          4 => %w[er ēris ētur ēmur ēminī entur]
        },
      },
      perfect: {
        active: Hash.new(%w[erim erīs erit erīmus erītis erint]),
        passive: Hash.new([' sim', ' sīs', ' sit', ' sīmus', ' sītis', ' sint'])
      },
      pluperfect: {
        active: Hash.new(%w[issem issēs isset issēmus issētis issent]),
        passive: Hash.new([' essem', ' essēs', ' esset', ' essēmus', ' essētis', ' essent'])
      }
    }
  }.freeze
end
