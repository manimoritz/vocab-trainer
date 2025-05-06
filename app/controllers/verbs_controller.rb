class VerbsController < ApplicationController
  before_action :set_verbs_to_learn, only: %i[index show]

  def index
    random_id = random_id(Verb)
    @verb = Verb.find(random_id)
  end

  def show
    puts params
    render :index if @verbs.empty?

    random_id = random_id(@verbs)
    @verb = @verbs.find(random_id)
  end

  def new
    @verb = Verb.new
  end

  def create
    verb_params = params.expect(verb: %i[present_active present_infinitive perfect_active supine])
    @verb = Verb.new(verb_params)
    if @verb.save
      # @conjugation_list = conjugation_list
      # render :new, status: :success
      @conjugation_matches = compare_conjugation_with_file(@verb)
      render :conjugation_table
    else
      render :new, locals: { success: true }, status: :unprocessable_entity
    end
  end

  def check_conjugation
    params.expect(:id, :input, conjugation: %i[person number tense voice mood])

    verb = Verb.find(params[:id])
    mood, number, person, tense, voice = params[:conjugation].values
    @form = verb.forms.find_by(person: person, number: number, tense: tense, voice: voice, mood: mood)

    random_id = random_id(Verb)
    @verb = Verb.find(random_id)

    if params[:input] == @form.text
      render :show, locals: { success: true }
    else
      render :show, locals: { error: true }
    end
  end

  private

  def set_verbs_to_learn
    @verbs = Verb.not_learned_yet
  end

  # Returns a number that is at least 1 and at most the number of elements in the Model.
  # @param model [ActiveRecord] The model from which we want a random ID.
  # @return [Integer] A number that is at least 1 and at most the number of elements in the Model.
  def random_id(model)
    rand(model.count).to_i + 1
  end

  def compare_conjugation_with_file(verb)
    file_path = Rails.root.join('conjugations', "#{verb.present_active[..-2]}o.txt")
    system("rake latin:fetch VERB=#{verb.present_active[..-2]}o") unless File.exist?(file_path)

    file_data = eval(File.read(file_path))
    memory_data = verb.conjugation_list.map { |f| f[:text] }

    comparison = {}

    memory_data.each_with_index do |val, idx|
      comparison[idx] = val == file_data.flatten[idx]
    end

    comparison
  end
end
