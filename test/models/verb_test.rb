require 'test_helper'

class VerbTest < ActiveSupport::TestCase
  test 'first conjugation list' do
    amare = verbs(:amare)
    assert_conjugation_list(
      amare,
      [%w[amō amās amat amāmus amātis amant],
       %w[amābō amābis amābit amābimus amābitis amābunt],
       %w[amābam amābās amābat amābāmus amābātis amābant],
       %w[amāvī amāvistī amāvit amāvimus amāvistis amāvērunt],
       %w[amāverō amāveris amāverit amāverimus amāveritis amāverint],
       %w[amāveram amāverās amāverat amāverāmus amāverātis amāverant]]
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
    assert_conjugation_list_for(debere, 'present', 'active', 'indicative',
                                %w[dēbeō dēbēs dēbet dēbēmus dēbētis dēbent])
    docere = verbs(:docere)
    assert_conjugation_list_for(docere, 'present', 'active', 'indicative',
                                %w[doceō docēs docet docēmus docētis docent])
  end

  test 'third conjugation list' do
    carpere = verbs(:carpere)
    assert_conjugation_list_for(carpere, 'present', 'active', 'indicative',
                                %w[carpō carpis carpit carpimus carpitis carpunt])

    cedere = verbs(:cedere)
    assert_conjugation_list_for(cedere, 'present', 'active', 'indicative',
                                %w[cēdō cēdis cēdit cēdimus cēditis cēdunt])
  end

  test 'third conjugation io variant list' do
    conspicere = verbs(:conspicere)
    assert_conjugation_list_for(conspicere, 'present', 'active', 'indicative',
                                %w[cōnspiciō cōnspicis cōnspicit cōnspicimus cōnspicitis cōnspiciunt])

    capere = verbs(:capere)
    assert_conjugation_list_for(capere, 'present', 'active', 'indicative',
                                %w[capiō capis capit capimus capitis capiunt])
  end

  test 'fourth conjugation list' do
    audire = verbs(:audire)
    assert_conjugation_list_for(audire, 'present', 'active', 'indicative',
                                %w[audiō audīs audit audīmus audītis audiunt])

    custodire = verbs(:custodire)
    assert_conjugation_list_for(custodire, 'present', 'active', 'indicative',
                                %w[custōdiō custōdīs custōdit custōdīmus custōdītis custōdiunt])
  end
end
