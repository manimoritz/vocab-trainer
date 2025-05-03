ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...

    def assert_conjugation_list(verb, forms)
      combinations = [
        %w[present active indicative],
        %w[future active indicative],
        %w[imperfect active indicative],
        %w[perfect active indicative],
        %w[future_perfect active indicative],
        %w[pluperfect active indicative],

        %w[present passive indicative],
        %w[future passive indicative],
        %w[imperfect passive indicative],
        %w[perfect passive indicative],
        %w[future_perfect passive indicative],
        %w[pluperfect passive indicative],

        %w[present active subjunctive],
        %w[imperfect active subjunctive],
        %w[perfect active subjunctive],
        %w[pluperfect active subjunctive],

        %w[present passive subjunctive],
        %w[imperfect passive subjunctive],
        %w[perfect passive subjunctive],
        %w[pluperfect passive subjunctive]
      ]

      combinations.each_with_index do |(tense, voice, mood), i|
        next unless forms[i]

        assert_conjugation_list_for(verb, tense, voice, mood, forms[i])
      end
    end

    def assert_conjugation_list_for(verb, tense, voice, mood, forms)
      assert_equal forms,
                   verb.conjugation_list
                       .filter { |c| [c[:tense], c[:voice], c[:mood]] == [tense, voice, mood] }
                       .map { |c| c[:text] },
                   "Wrong form for #{tense} #{voice} #{mood}"
    end
  end
end
