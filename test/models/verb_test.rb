require 'test_helper'

class VerbTest < ActiveSupport::TestCase
  test 'first conjugation list' do
    amare = verbs(:amare)
    assert_conjugation_list(
      amare,
      [
        # active indicative
        %w[amō amās amat amāmus amātis amant],
        %w[amābō amābis amābit amābimus amābitis amābunt],
        %w[amābam amābās amābat amābāmus amābātis amābant],
        %w[amāvī amāvistī amāvit amāvimus amāvistis amāvērunt],
        %w[amāverō amāveris amāverit amāverimus amāveritis amāverint],
        %w[amāveram amāverās amāverat amāverāmus amāverātis amāverant],
        # passive indicative
        %w[amor amāris amātur amāmur amāminī amantur],
        %w[amābor amāberis amābitur amābimur amābiminī amābuntur],
        %w[amābar amābāris amābātur amābāmur amābāminī amābantur],
        ['amātum sum', 'amātum es', 'amātum est', 'amātum sumus', 'amātum estis', 'amātum sunt'],
        ['amātum erō', 'amātum eris', 'amātum erit', 'amātum erimus', 'amātum eritis', 'amātum erunt'],
        ['amātum eram', 'amātum erās', 'amātum erat', 'amātum erāmus', 'amātum erātis', 'amātum erant'],
        # active subjunctive
        %w[amem amēs amet amēmus amētis ament],

        %w[amārem amārēs amāret amārēmus amārētis amārent],
        %w[amāverim amāverīs amāverit amāverīmus amāverītis amāverint],

        %w[amāvissem amāvissēs amāvisset amāvissēmus amāvissētis amāvissent],
        # passive subjunctive
        %w[amer amēris amētur amēmur amēminī amentur],

        %w[amārer amārēris amārētur amārēmur amārēminī amārentur],
        ['amātum sim', 'amātum sīs', 'amātum sit', 'amātum sīmus', 'amātum sītis', 'amātum sint'],

        ['amātum essem', 'amātum essēs', 'amātum esset', 'amātum essēmus', 'amātum essētis', 'amātum essent']
      ]
    )

    imperare = verbs(:imperare)
    assert_conjugation_list(
      imperare,
      [%w[imperō imperās imperat imperāmus imperātis imperant],
       %w[imperābō imperābis imperābit imperābimus imperābitis imperābunt],
       %w[imperābam imperābās imperābat imperābāmus imperābātis imperābant],
       %w[imperāvī imperāvistī imperāvit imperāvimus imperāvistis imperāvērunt],
       %w[imperāverō imperāveris imperāverit imperāverimus imperāveritis imperāverint],
       %w[imperāveram imperāverās imperāverat imperāverāmus imperāverātis imperāverant]]
    )
  end

  test 'second conjugation list' do
    debere = verbs(:debere)
    assert_conjugation_list(
      debere,
      [%w[dēbeō dēbēs dēbet dēbēmus dēbētis dēbent],
       %w[dēbēbō dēbēbis dēbēbit dēbēbimus dēbēbitis dēbēbunt],
       %w[dēbēbam dēbēbās dēbēbat dēbēbāmus dēbēbātis dēbēbant],
       %w[dēbuī dēbuistī dēbuit dēbuimus dēbuistis dēbuērunt],
       %w[dēbuerō dēbueris dēbuerit dēbuerimus dēbueritis dēbuerint],
       %w[dēbueram dēbuerās dēbuerat dēbuerāmus dēbuerātis dēbuerant]]
    )

    docere = verbs(:docere)
    assert_conjugation_list(
      docere,
      [%w[doceō docēs docet docēmus docētis docent],
       %w[docēbō docēbis docēbit docēbimus docēbitis docēbunt],
       %w[docēbam docēbās docēbat docēbāmus docēbātis docēbant],
       %w[docuī docuistī docuit docuimus docuistis docuērunt],
       %w[docuerō docueris docuerit docuerimus docueritis docuerint],
       %w[docueram docuerās docuerat docuerāmus docuerātis docuerant]]
    )
  end

  test 'third conjugation list' do
    carpere = verbs(:carpere)
    assert_conjugation_list(
      carpere,
      [%w[carpō carpis carpit carpimus carpitis carpunt],
       %w[carpam carpēs carpet carpēmus carpētis carpent],
       %w[carpēbam carpēbās carpēbat carpēbāmus carpēbātis carpēbant],
       %w[carpsī carpsistī carpsit carpsimus carpsistis carpsērunt],
       %w[carpserō carpseris carpserit carpserimus carpseritis carpserint],
       %w[carpseram carpserās carpserat carpserāmus carpserātis carpserant]]
    )

    cedere = verbs(:cedere)
    assert_conjugation_list(
      cedere,
      [%w[cēdō cēdis cēdit cēdimus cēditis cēdunt],
       %w[cēdam cēdēs cēdet cēdēmus cēdētis cēdent],
       %w[cēdēbam cēdēbās cēdēbat cēdēbāmus cēdēbātis cēdēbant],
       %w[cessī cessistī cessit cessimus cessistis cessērunt],
       %w[cesserō cesseris cesserit cesserimus cesseritis cesserint],
       %w[cesseram cesserās cesserat cesserāmus cesserātis cesserant]]
    )
  end

  test 'third conjugation io variant list' do
    conspicere = verbs(:conspicere)
    assert_conjugation_list(
      conspicere,
      [%w[cōnspiciō cōnspicis cōnspicit cōnspicimus cōnspicitis cōnspiciunt],
       %w[cōnspiciam cōnspiciēs cōnspiciet cōnspiciēmus cōnspiciētis cōnspicient],
       %w[cōnspiciēbam cōnspiciēbās cōnspiciēbat cōnspiciēbāmus cōnspiciēbātis cōnspiciēbant],
       %w[cōnspexī cōnspexistī cōnspexit cōnspeximus cōnspexistis cōnspexērunt],
       %w[cōnspexerō cōnspexeris cōnspexerit cōnspexerimus cōnspexeritis cōnspexerint],
       %w[cōnspexeram cōnspexerās cōnspexerat cōnspexerāmus cōnspexerātis cōnspexerant]]
    )

    capere = verbs(:capere)
    assert_conjugation_list(
      capere,
      [%w[capiō capis capit capimus capitis capiunt],
       %w[capiam capiēs capiet capiēmus capiētis capient],
       %w[capiēbam capiēbās capiēbat capiēbāmus capiēbātis capiēbant],
       %w[cēpī cēpistī cēpit cēpimus cēpistis cēpērunt],
       %w[cēperō cēperis cēperit cēperimus cēperitis cēperint],
       %w[cēperam cēperās cēperat cēperāmus cēperātis cēperant]]
    )
  end

  test 'fourth conjugation list' do
    audire = verbs(:audire)
    assert_conjugation_list(
      audire,
      [%w[audiō audīs audit audīmus audītis audiunt],
       %w[audiam audiēs audiet audiēmus audiētis audient],
       %w[audiēbam audiēbās audiēbat audiēbāmus audiēbātis audiēbant],
       %w[audīvī audīvistī audīvit audīvimus audīvistis audīvērunt],
       %w[audīverō audīveris audīverit audīverimus audīveritis audīverint],
       %w[audīveram audīverās audīverat audīverāmus audīverātis audīverant]]
    )

    custodire = verbs(:custodire)
    assert_conjugation_list(
      custodire,
      [%w[custōdiō custōdīs custōdit custōdīmus custōdītis custōdiunt],
       %w[custōdiam custōdiēs custōdiet custōdiēmus custōdiētis custōdient],
       %w[custōdiēbam custōdiēbās custōdiēbat custōdiēbāmus custōdiēbātis custōdiēbant],
       %w[custōdīvī custōdīvistī custōdīvit custōdīvimus custōdīvistis custōdīvērunt],
       %w[custōdīverō custōdīveris custōdīverit custōdīverimus custōdīveritis custōdīverint],
       %w[custōdīveram custōdīverās custōdīverat custōdīverāmus custōdīverātis custōdīverant]]
    )
  end
end
