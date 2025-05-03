require 'test_helper'

class VerbTest < ActiveSupport::TestCase
  test 'first conjugation list' do
    amare = verbs(:amare)
    assert_conjugation_list(
      amare,
      [%w[amõ amãs amat amãmus amãtis amant],
       %w[amãbõ amãbis amãbit amãbimus amãbitis amãbunt],
       %w[amãbam amãbãs amãbat amãbãmus amãbãtis amãbant],
       %w[amãvĩ amãvistĩ amãvit amãvimus amãvistis amãvẽrunt],
       %w[amãverõ amãveris amãverit amãverimus amãveritis amãverint],
       %w[amãveram amãverãs amãverat amãverãmus amãverãtis amãverant]]
    )

    imperare = verbs(:imperare)
    assert_conjugation_list(
      imperare,
      [%w[imperõ imperãs imperat imperãmus imperãtis imperant],
       %w[imperãbõ imperãbis imperãbit imperãbimus imperãbitis imperãbunt],
       %w[imperãbam imperãbãs imperãbat imperãbãmus imperãbãtis imperãbant],
       %w[imperãvĩ imperãvistĩ imperãvit imperãvimus imperãvistis imperãvẽrunt],
       %w[imperãverõ imperãveris imperãverit imperãverimus imperãveritis imperãverint],
       %w[imperãveram imperãverãs imperãverat imperãverãmus imperãverãtis imperãverant]]
    )
  end

  test 'second conjugation list' do
    debere = verbs(:debere)
    assert_conjugation_list_for(debere, 'present', 'active', 'indicative',
                                %w[dẽbeõ dẽbẽs dẽbet dẽbẽmus dẽbẽtis dẽbent])
    docere = verbs(:docere)
    assert_conjugation_list_for(docere, 'present', 'active', 'indicative',
                                %w[doceõ docẽs docet docẽmus docẽtis docent])
  end

  test 'third conjugation list' do
    carpere = verbs(:carpere)
    assert_conjugation_list_for(carpere, 'present', 'active', 'indicative',
                                %w[carpõ carpis carpit carpimus carpitis carpunt])

    cedere = verbs(:cedere)
    assert_conjugation_list_for(cedere, 'present', 'active', 'indicative',
                                %w[cẽdõ cẽdis cẽdit cẽdimus cẽditis cẽdunt])
  end

  test 'third conjugation io variant list' do
    conspicere = verbs(:conspicere)
    assert_conjugation_list_for(conspicere, 'present', 'active', 'indicative',
                                %w[cõnspiciõ cõnspicis cõnspicit cõnspicimus cõnspicitis cõnspiciunt])

    capere = verbs(:capere)
    assert_conjugation_list_for(capere, 'present', 'active', 'indicative',
                                %w[capiõ capis capit capimus capitis capiunt])
  end

  test 'fourth conjugation list' do
    audire = verbs(:audire)
    assert_conjugation_list_for(audire, 'present', 'active', 'indicative',
                                %w[audiõ audĩs audit audĩmus audĩtis audiunt])

    custodire = verbs(:custodire)
    assert_conjugation_list_for(custodire, 'present', 'active', 'indicative',
                                %w[custõdiõ custõdĩs custõdit custõdĩmus custõdĩtis custõdiunt])
  end
end
