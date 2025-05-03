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

    def assert_conjugation_list_for(verb, tense, voice, mood, forms)
      assert_equal forms,
                   verb.conjugation_list
                       .filter { |c| [c[:tense], c[:voice], c[:mood]] == %w[present active indicative] }
                       .map { |c| c[:text] },
                   "Wrong form for #{tense} #{voice} #{mood}"
    end
  end
end
