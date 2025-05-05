require 'test_helper'

class VerbTest < ActiveSupport::TestCase
  test 'first conjugation list' do
    amare = verbs(:amare)
    assert_conjugation_list(
      amare,
      [
        # Active Indicative
        %w[amō amās amat amāmus amātis amant],
        %w[amābō amābis amābit amābimus amābitis amābunt],
        %w[amābam amābās amābat amābāmus amābātis amābant],
        %w[amāvī amāvistī amāvit amāvimus amāvistis amāvērunt],
        %w[amāverō amāveris amāverit amāverimus amāveritis amāverint],
        %w[amāveram amāverās amāverat amāverāmus amāverātis amāverant],
        # Passive Indicative
        %w[amor amāris amātur amāmur amāminī amantur],
        %w[amābor amāberis amābitur amābimur amābiminī amābuntur],
        %w[amābar amābāris amābātur amābāmur amābāminī amābantur],
        ['amātum sum', 'amātum es', 'amātum est', 'amātum sumus', 'amātum estis', 'amātum sunt'],
        ['amātum erō', 'amātum eris', 'amātum erit', 'amātum erimus', 'amātum eritis', 'amātum erunt'],
        ['amātum eram', 'amātum erās', 'amātum erat', 'amātum erāmus', 'amātum erātis', 'amātum erant'],
        # Active Subjunctive
        %w[amem amēs amet amēmus amētis ament],

        %w[amārem amārēs amāret amārēmus amārētis amārent],
        %w[amāverim amāverīs amāverit amāverīmus amāverītis amāverint],

        %w[amāvissem amāvissēs amāvisset amāvissēmus amāvissētis amāvissent],
        # Passive Subjunctive
        %w[amer amēris amētur amēmur amēminī amentur],

        %w[amārer amārēris amārētur amārēmur amārēminī amārentur],
        ['amātum sim', 'amātum sīs', 'amātum sit', 'amātum sīmus', 'amātum sītis', 'amātum sint'],

        ['amātum essem', 'amātum essēs', 'amātum esset', 'amātum essēmus', 'amātum essētis', 'amātum essent']
      ]
    )

    imperare = verbs(:imperare)
    assert_conjugation_list(
      imperare,
      [
        %w[imperō imperās imperat imperāmus imperātis imperant],
        %w[imperābō imperābis imperābit imperābimus imperābitis imperābunt],
        %w[imperābam imperābās imperābat imperābāmus imperābātis imperābant],
        %w[imperāvī imperāvistī imperāvit imperāvimus imperāvistis imperāvērunt],
        %w[imperāverō imperāveris imperāverit imperāverimus imperāveritis imperāverint],
        %w[imperāveram imperāverās imperāverat imperāverāmus imperāverātis imperāverant],
        # passive indicative
        %w[imperor imperāris imperātur imperāmur imperāminī imperantur],
        %w[imperābor imperāberis imperābitur imperābimur imperābiminī imperābuntur],
        %w[imperābar imperābāris imperābātur imperābāmur imperābāminī imperābantur],
        ['imperātum sum', 'imperātum es', 'imperātum est', 'imperātum sumus', 'imperātum estis', 'imperātum sunt'],
        ['imperātum erō', 'imperātum eris', 'imperātum erit', 'imperātum erimus', 'imperātum eritis',
         'imperātum erunt'],
        ['imperātum eram', 'imperātum erās', 'imperātum erat', 'imperātum erāmus', 'imperātum erātis',
         'imperātum erant'],
        # active subjunctive
        %w[imperem imperēs imperet imperēmus imperētis imperent],

        %w[imperārem imperārēs imperāret imperārēmus imperārētis imperārent],
        %w[imperāverim imperāverīs imperāverit imperāverīmus imperāverītis imperāverint],

        %w[imperāvissem imperāvissēs imperāvisset imperāvissēmus imperāvissētis imperāvissent],
        # passive subjunctive
        %w[imperer imperēris imperētur imperēmur imperēminī imperentur],

        %w[imperārer imperārēris imperārētur imperārēmur imperārēminī imperārentur],
        ['imperātum sim', 'imperātum sīs', 'imperātum sit', 'imperātum sīmus', 'imperātum sītis', 'imperātum sint'],

        ['imperātum essem', 'imperātum essēs', 'imperātum esset', 'imperātum essēmus', 'imperātum essētis',
         'imperātum essent']
      ]
    )
  end

  test 'second conjugation list' do
    debere = verbs(:debere)
    assert_conjugation_list(
      debere,
      [
        # Active Indicative
        %w[dēbeō dēbēs dēbet dēbēmus dēbētis dēbent],
        %w[dēbēbō dēbēbis dēbēbit dēbēbimus dēbēbitis dēbēbunt],
        %w[dēbēbam dēbēbās dēbēbat dēbēbāmus dēbēbātis dēbēbant],
        %w[dēbuī dēbuistī dēbuit dēbuimus dēbuistis dēbuērunt],
        %w[dēbuerō dēbueris dēbuerit dēbuerimus dēbueritis dēbuerint],
        %w[dēbueram dēbuerās dēbuerat dēbuerāmus dēbuerātis dēbuerant],
        # Passive Indicative
        %w[dēbeor dēbēris dēbētur dēbēmur dēbēminī dēbentur],
        %w[dēbēbor dēbēberis dēbēbitur dēbēbimur dēbēbiminī dēbēbuntur],
        %w[dēbēbar dēbēbāris dēbēbātur dēbēbāmur dēbēbāminī dēbēbantur],
        ['dēbitum sum', 'dēbitum es', 'dēbitum est', 'dēbitum sumus', 'dēbitum estis', 'dēbitum sunt'],
        ['dēbitum erō', 'dēbitum eris', 'dēbitum erit', 'dēbitum erimus', 'dēbitum eritis', 'dēbitum erunt'],
        ['dēbitum eram', 'dēbitum erās', 'dēbitum erat', 'dēbitum erāmus', 'dēbitum erātis', 'dēbitum erant'],
        # Active Subjunctive
        %w[dēbeam dēbeās dēbeat dēbeāmus dēbeātis dēbeant],

        %w[dēbērem dēbērēs dēbēret dēbērēmus dēbērētis dēbērent],
        %w[dēbuerim dēbuerīs dēbuerit dēbuerīmus dēbuerītis dēbuerint],

        %w[dēbuissem dēbuissēs dēbuisset dēbuissēmus dēbuissētis dēbuissent],
        # Passive Subjunctive
        %w[dēbear dēbeāris dēbeātur dēbeāmur dēbeāminī dēbeantur],

        %w[dēbērer dēbērēris dēbērētur dēbērēmur dēbērēminī dēbērentur],
        ['dēbitum sim', 'dēbitum sīs', 'dēbitum sit', 'dēbitum sīmus', 'dēbitum sītis', 'dēbitum sint'],

        ['dēbitum essem', 'dēbitum essēs', 'dēbitum esset', 'dēbitum essēmus', 'dēbitum essētis', 'dēbitum essent']
      ]
    )

    docere = verbs(:docere)
    assert_conjugation_list(
      docere,
      [
        # Active Indicative
        %w[doceō docēs docet docēmus docētis docent],
        %w[docēbō docēbis docēbit docēbimus docēbitis docēbunt],
        %w[docēbam docēbās docēbat docēbāmus docēbātis docēbant],
        %w[docuī docuistī docuit docuimus docuistis docuērunt],
        %w[docuerō docueris docuerit docuerimus docueritis docuerint],
        %w[docueram docuerās docuerat docuerāmus docuerātis docuerant],
        # Passive Indicative
        %w[doceor docēris docētur docēmur docēminī docentur],
        %w[docēbor docēberis docēbitur docēbimur docēbiminī docēbuntur],
        %w[docēbar docēbāris docēbātur docēbāmur docēbāminī docēbantur],
        ['doctum sum', 'doctum es', 'doctum est', 'doctum sumus', 'doctum estis', 'doctum sunt'],
        ['doctum erō', 'doctum eris', 'doctum erit', 'doctum erimus', 'doctum eritis', 'doctum erunt'],
        ['doctum eram', 'doctum erās', 'doctum erat', 'doctum erāmus', 'doctum erātis', 'doctum erant'],
        # Active Subjunctive
        %w[doceam doceās doceat doceāmus doceātis doceant],

        %w[docērem docērēs docēret docērēmus docērētis docērent],
        %w[docuerim docuerīs docuerit docuerīmus docuerītis docuerint],

        %w[docuissem docuissēs docuisset docuissēmus docuissētis docuissent],
        # Passive Subjunctive
        %w[docear doceāris doceātur doceāmur doceāminī doceantur],

        %w[docērer docērēris docērētur docērēmur docērēminī docērentur],
        ['doctum sim', 'doctum sīs', 'doctum sit', 'doctum sīmus', 'doctum sītis', 'doctum sint'],

        ['doctum essem', 'doctum essēs', 'doctum esset', 'doctum essēmus', 'doctum essētis', 'doctum essent']
      ]
    )
  end

  test 'third conjugation list' do
    carpere = verbs(:carpere)
    assert_conjugation_list(
      carpere,
      [
        # Active Indicative
        %w[carpō carpis carpit carpimus carpitis carpunt],
        %w[carpam carpēs carpet carpēmus carpētis carpent],
        %w[carpēbam carpēbās carpēbat carpēbāmus carpēbātis carpēbant],
        %w[carpsī carpsistī carpsit carpsimus carpsistis carpsērunt],
        %w[carpserō carpseris carpserit carpserimus carpseritis carpserint],
        %w[carpseram carpserās carpserat carpserāmus carpserātis carpserant],
        # Passive Indicative
        %w[carpor carperis carpitur carpimur carpiminī carpuntur],
        %w[carpar carpēris carpētur carpēmur carpēminī carpentur],
        %w[carpēbar carpēbāris carpēbātur carpēbāmur carpēbāminī carpēbantur],
        ['carptum sum', 'carptum es', 'carptum est', 'carptum sumus', 'carptum estis', 'carptum sunt'],
        ['carptum erō', 'carptum eris', 'carptum erit', 'carptum erimus', 'carptum eritis', 'carptum erunt'],
        ['carptum eram', 'carptum erās', 'carptum erat', 'carptum erāmus', 'carptum erātis', 'carptum erant'],
        # Active Subjunctive
        %w[carpam carpās carpat carpāmus carpātis carpant],

        %w[carperem carperēs carperet carperēmus carperētis carperent],
        %w[carpserim carpserīs carpserit carpserīmus carpserītis carpserint],

        %w[carpsissem carpsissēs carpsisset carpsissēmus carpsissētis carpsissent],
        # Passive Subjunctive
        %w[carpar carpāris carpātur carpāmur carpāminī carpantur],

        %w[carperer carperēris carperētur carperēmur carperēminī carperentur],
        ['carptum sim', 'carptum sīs', 'carptum sit', 'carptum sīmus', 'carptum sītis', 'carptum sint'],

        ['carptum essem', 'carptum essēs', 'carptum esset', 'carptum essēmus', 'carptum essētis', 'carptum essent']
      ]
    )

    cedere = verbs(:cedere)
    assert_conjugation_list(
      cedere,
      [
        # Active Indicative
        %w[cēdō cēdis cēdit cēdimus cēditis cēdunt],
        %w[cēdam cēdēs cēdet cēdēmus cēdētis cēdent],
        %w[cēdēbam cēdēbās cēdēbat cēdēbāmus cēdēbātis cēdēbant],
        %w[cessī cessistī cessit cessimus cessistis cessērunt],
        %w[cesserō cesseris cesserit cesserimus cesseritis cesserint],
        %w[cesseram cesserās cesserat cesserāmus cesserātis cesserant],
        # Passive Indicative
        %w[cēdor cēderis cēditur cēdimur cēdiminī cēduntur],
        %w[cēdar cēdēris cēdētur cēdēmur cēdēminī cēdentur],
        %w[cēdēbar cēdēbāris cēdēbātur cēdēbāmur cēdēbāminī cēdēbantur],
        ['cessum sum', 'cessum es', 'cessum est', 'cessum sumus', 'cessum estis', 'cessum sunt'],
        ['cessum erō', 'cessum eris', 'cessum erit', 'cessum erimus', 'cessum eritis', 'cessum erunt'],
        ['cessum eram', 'cessum erās', 'cessum erat', 'cessum erāmus', 'cessum erātis', 'cessum erant'],
        # Active Subjunctive
        %w[cēdam cēdās cēdat cēdāmus cēdātis cēdant],

        %w[cēderem cēderēs cēderet cēderēmus cēderētis cēderent],
        %w[cesserim cesserīs cesserit cesserīmus cesserītis cesserint],

        %w[cessissem cessissēs cessisset cessissēmus cessissētis cessissent],
        # Passive Subjunctive
        %w[cēdar cēdāris cēdātur cēdāmur cēdāminī cēdantur],

        %w[cēderer cēderēris cēderētur cēderēmur cēderēminī cēderentur],
        ['cessum sim', 'cessum sīs', 'cessum sit', 'cessum sīmus', 'cessum sītis', 'cessum sint'],

        ['cessum essem', 'cessum essēs', 'cessum esset', 'cessum essēmus', 'cessum essētis', 'cessum essent']
      ]
    )
  end

  test 'third conjugation io variant list' do
    conspicere = verbs(:conspicere)
    assert_conjugation_list(
      conspicere,
      [
        # Active Indicative
        %w[cōnspiciō cōnspicis cōnspicit cōnspicimus cōnspicitis cōnspiciunt],
        %w[cōnspiciam cōnspiciēs cōnspiciet cōnspiciēmus cōnspiciētis cōnspicient],
        %w[cōnspiciēbam cōnspiciēbās cōnspiciēbat cōnspiciēbāmus cōnspiciēbātis cōnspiciēbant],
        %w[cōnspexī cōnspexistī cōnspexit cōnspeximus cōnspexistis cōnspexērunt],
        %w[cōnspexerō cōnspexeris cōnspexerit cōnspexerimus cōnspexeritis cōnspexerint],
        %w[cōnspexeram cōnspexerās cōnspexerat cōnspexerāmus cōnspexerātis cōnspexerant],
        # Passive Indicative
        %w[cōnspicior cōnspiceris cōnspicitur cōnspicimur cōnspiciminī cōnspiciuntur],
        %w[cōnspiciar cōnspiciēris cōnspiciētur cōnspiciēmur cōnspiciēminī cōnspicientur],
        %w[cōnspiciēbar cōnspiciēbāris cōnspiciēbātur cōnspiciēbāmur cōnspiciēbāminī cōnspiciēbantur],
        ['cōnspectum sum', 'cōnspectum es', 'cōnspectum est', 'cōnspectum sumus', 'cōnspectum estis',
         'cōnspectum sunt'],
        ['cōnspectum erō', 'cōnspectum eris', 'cōnspectum erit', 'cōnspectum erimus', 'cōnspectum eritis',
         'cōnspectum erunt'],
        ['cōnspectum eram', 'cōnspectum erās', 'cōnspectum erat', 'cōnspectum erāmus', 'cōnspectum erātis',
         'cōnspectum erant'],
        # Active Subjunctive
        %w[cōnspiciam cōnspiciās cōnspiciat cōnspiciāmus cōnspiciātis cōnspiciant],

        %w[cōnspicerem cōnspicerēs cōnspiceret cōnspicerēmus cōnspicerētis cōnspicerent],
        %w[cōnspexerim cōnspexerīs cōnspexerit cōnspexerīmus cōnspexerītis cōnspexerint],

        %w[cōnspexissem cōnspexissēs cōnspexisset cōnspexissēmus cōnspexissētis cōnspexissent],
        # Passive Subjunctive
        %w[cōnspiciar cōnspiciāris cōnspiciātur cōnspiciāmur cōnspiciāminī cōnspiciantur],

        %w[cōnspicerer cōnspicerēris cōnspicerētur cōnspicerēmur cōnspicerēminī cōnspicerentur],
        ['cōnspectum sim', 'cōnspectum sīs', 'cōnspectum sit', 'cōnspectum sīmus', 'cōnspectum sītis',
         'cōnspectum sint'],

        ['cōnspectum essem', 'cōnspectum essēs', 'cōnspectum esset', 'cōnspectum essēmus', 'cōnspectum essētis',
         'cōnspectum essent']
      ]
    )

    capere = verbs(:capere)
    assert_conjugation_list(
      capere,
      [
        # Active Indicative
        %w[capiō capis capit capimus capitis capiunt],
        %w[capiam capiēs capiet capiēmus capiētis capient],
        %w[capiēbam capiēbās capiēbat capiēbāmus capiēbātis capiēbant],
        %w[cēpī cēpistī cēpit cēpimus cēpistis cēpērunt],
        %w[cēperō cēperis cēperit cēperimus cēperitis cēperint],
        %w[cēperam cēperās cēperat cēperāmus cēperātis cēperant],
        # Passive Indicative
        %w[capior caperis capitur capimur capiminī capiuntur],
        %w[capiar capiēris capiētur capiēmur capiēminī capientur],
        %w[capiēbar capiēbāris capiēbātur capiēbāmur capiēbāminī capiēbantur],
        ['captum sum', 'captum es', 'captum est', 'captum sumus', 'captum estis', 'captum sunt'],
        ['captum erō', 'captum eris', 'captum erit', 'captum erimus', 'captum eritis', 'captum erunt'],
        ['captum eram', 'captum erās', 'captum erat', 'captum erāmus', 'captum erātis', 'captum erant'],
        # Active Subjunctive
        %w[capiam capiās capiat capiāmus capiātis capiant],

        %w[caperem caperēs caperet caperēmus caperētis caperent],
        %w[cēperim cēperīs cēperit cēperīmus cēperītis cēperint],

        %w[cēpissem cēpissēs cēpisset cēpissēmus cēpissētis cēpissent],
        # Passive Subjunctive
        %w[capiar capiāris capiātur capiāmur capiāminī capiantur],

        %w[caperer caperēris caperētur caperēmur caperēminī caperentur],
        ['captum sim', 'captum sīs', 'captum sit', 'captum sīmus', 'captum sītis', 'captum sint'],

        ['captum essem', 'captum essēs', 'captum esset', 'captum essēmus', 'captum essētis', 'captum essent']
      ]
    )
  end

  test 'fourth conjugation list' do
    audire = verbs(:audire)
    assert_conjugation_list(
      audire,
      [
        # Active Indicative
        %w[audiō audīs audit audīmus audītis audiunt],
        %w[audiam audiēs audiet audiēmus audiētis audient],
        %w[audiēbam audiēbās audiēbat audiēbāmus audiēbātis audiēbant],
        %w[audīvī audīvistī audīvit audīvimus audīvistis audīvērunt],
        %w[audīverō audīveris audīverit audīverimus audīveritis audīverint],
        %w[audīveram audīverās audīverat audīverāmus audīverātis audīverant],
        # Passive Indicative
        %w[audior audīris audītur audīmur audīminī audiuntur],
        %w[audiar audiēris audiētur audiēmur audiēminī audientur],
        %w[audiēbar audiēbāris audiēbātur audiēbāmur audiēbāminī audiēbantur],
        ['audītum sum', 'audītum es', 'audītum est', 'audītum sumus', 'audītum estis', 'audītum sunt'],
        ['audītum erō', 'audītum eris', 'audītum erit', 'audītum erimus', 'audītum eritis', 'audītum erunt'],
        ['audītum eram', 'audītum erās', 'audītum erat', 'audītum erāmus', 'audītum erātis', 'audītum erant'],
        # Active Subjunctive
        %w[audiam audiās audiat audiāmus audiātis audiant],

        %w[audīrem audīrēs audīret audīrēmus audīrētis audīrent],
        %w[audīverim audīverīs audīverit audīverīmus audīverītis audīverint],

        %w[audīvissem audīvissēs audīvisset audīvissēmus audīvissētis audīvissent],
        # Passive Subjunctive
        %w[audiar audiāris audiātur audiāmur audiāminī audiantur],

        %w[audīrer audīrēris audīrētur audīrēmur audīrēminī audīrentur],
        ['audītum sim', 'audītum sīs', 'audītum sit', 'audītum sīmus', 'audītum sītis', 'audītum sint'],

        ['audītum essem', 'audītum essēs', 'audītum esset', 'audītum essēmus', 'audītum essētis', 'audītum essent']
      ]
    )

    custodire = verbs(:custodire)
    assert_conjugation_list(
      custodire,
      [
        # Active Indicative
        %w[custōdiō custōdīs custōdit custōdīmus custōdītis custōdiunt],
        %w[custōdiam custōdiēs custōdiet custōdiēmus custōdiētis custōdient],
        %w[custōdiēbam custōdiēbās custōdiēbat custōdiēbāmus custōdiēbātis custōdiēbant],
        %w[custōdīvī custōdīvistī custōdīvit custōdīvimus custōdīvistis custōdīvērunt],
        %w[custōdīverō custōdīveris custōdīverit custōdīverimus custōdīveritis custōdīverint],
        %w[custōdīveram custōdīverās custōdīverat custōdīverāmus custōdīverātis custōdīverant],
        # Passive Indicative
        %w[custōdior custōdīris custōdītur custōdīmur custōdīminī custōdiuntur],
        %w[custōdiar custōdiēris custōdiētur custōdiēmur custōdiēminī custōdientur],
        %w[custōdiēbar custōdiēbāris custōdiēbātur custōdiēbāmur custōdiēbāminī custōdiēbantur],
        ['custōdītum sum', 'custōdītum es', 'custōdītum est', 'custōdītum sumus', 'custōdītum estis',
         'custōdītum sunt'],
        ['custōdītum erō', 'custōdītum eris', 'custōdītum erit', 'custōdītum erimus', 'custōdītum eritis',
         'custōdītum erunt'],
        ['custōdītum eram', 'custōdītum erās', 'custōdītum erat', 'custōdītum erāmus', 'custōdītum erātis',
         'custōdītum erant'],
        # Active Subjunctive
        %w[custōdiam custōdiās custōdiat custōdiāmus custōdiātis custōdiant],

        %w[custōdīrem custōdīrēs custōdīret custōdīrēmus custōdīrētis custōdīrent],
        %w[custōdīverim custōdīverīs custōdīverit custōdīverīmus custōdīverītis custōdīverint],

        %w[custōdīvissem custōdīvissēs custōdīvisset custōdīvissēmus custōdīvissētis custōdīvissent],
        # Passive Subjunctive
        %w[custōdiar custōdiāris custōdiātur custōdiāmur custōdiāminī custōdiantur],

        %w[custōdīrer custōdīrēris custōdīrētur custōdīrēmur custōdīrēminī custōdīrentur],
        ['custōdītum sim', 'custōdītum sīs', 'custōdītum sit', 'custōdītum sīmus', 'custōdītum sītis',
         'custōdītum sint'],

        ['custōdītum essem', 'custōdītum essēs', 'custōdītum esset', 'custōdītum essēmus', 'custōdītum essētis',
         'custōdītum essent']
      ]
    )
  end
end
