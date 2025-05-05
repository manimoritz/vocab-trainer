require 'nokogiri'
require 'open-uri'
require 'fileutils'

namespace :latin do
  desc 'Fetch Latin verb conjugation from Wiktionary'
  task fetch: :environment do
    verb = ENV['VERB']
    output_dir = 'conjugations'
    raise 'No verb provided.' unless verb

    url = "https://en.wiktionary.org/wiki/#{URI.encode_www_form_component(verb)}#Latin"
    puts "Fetching: #{url}"

    html = URI.open(url, 'User-Agent' => 'Ruby').read
    doc = Nokogiri::HTML(html)

    # Find the NavFrame with 'Conjugation of ...' heading
    nav_frame = doc.css('.NavFrame').find do |frame|
      frame.at('.NavHead')&.text&.include?('Conjugation of')
    end
    raise 'Conjugation table not found.' unless nav_frame

    # Find the first table with class '.roa-inflection-table' (Latin verb conjugations)
    table = nav_frame.at('table.roa-inflection-table')
    raise 'Inflection table not found.' unless table

    tenses = ['present', 'future', 'imperfect', 'perfect', 'future perfect', 'pluperfect']
    labels = {
      0 => 'Active Indicative',
      6 => 'Passive Indicative',
      12 => 'Active Subjunctive',
      16 => 'Passive Subjunctive'
    }
    line_break_indices = [13, 15, 17, 19]
    supine_indices = [9, 10, 11, 18, 19]

    supine = extract_supine(table)
    raise 'No supine case found.' if supine.empty?

    conjugation_data = extract_conjugation_rows(table, tenses)

    # Format conjugation data for the verb
    formatted_data = [
      # Active Indicative
      conjugation_data[0],  # Present Active Indicative
      conjugation_data[2],  # Future Active Indicative
      conjugation_data[1],  # Imperfect Active Indicative
      conjugation_data[3],  # Perfect Active Indicative
      conjugation_data[5],  # Future Perfect Active Indicative
      conjugation_data[4],  # Pluperfect Active Indicative
      # Passive Indicative
      conjugation_data[6],  # Present Passive Indicative
      conjugation_data[8],  # Imperfect Passive Indicative
      conjugation_data[7],  # Future Passive Indicative
      [' sum', ' es', ' est', ' sumus', ' estis', ' sunt'],
      [' erō', ' eris', ' erit', ' erimus', ' eritis', ' erunt'],
      [' eram', ' erās', ' erat', ' erāmus', ' erātis', ' erant'],

      # Active Subjunctive
      conjugation_data[9], # Present Subjunctive

      conjugation_data[10], # Imperfect Subjunctive
      conjugation_data[11], # Perfect Subjunctive

      conjugation_data[12], # Pluperfect Subjunctive
      # Passive Subjunctive
      conjugation_data[13], # Present Passive Subjunctive

      conjugation_data[14], # Imperfect Passive Subjunctive
      [' sim', ' sīs', ' sit', ' sīmus', ' sītis', ' sint'],

      [' essem', ' essēs', ' esset', ' essēmus', ' essētis', ' essent']
    ]

    # Write the output to a text file
    FileUtils.mkdir_p(output_dir)
    File.open("#{output_dir}/#{verb}.txt", 'w:utf-8') do |f|
      f.puts '['
      formatted_data.each_with_index do |line, idx|
        f.puts "  # #{labels[idx]}" if labels[idx]
        f.puts "\n" if line_break_indices.include?(idx)

        use_supine = supine_indices.include?(idx)
        is_last = idx == formatted_data.size - 1

        f.puts format_line(line, supine: supine, use_supine: use_supine, is_last: is_last)
      end
      f.puts ']'
    end

    puts "Conjugation saved to #{output_dir}/#{verb}.txt"
  end

  def extract_supine(table)
    table.css('td').css('span[class*="sup-form-of"]').first&.text&.strip
  end

  def extract_conjugation_rows(table, tenses)
    extracted_rows = []
    table.css('tr').map do |row|
      row_headers = row.css('th').map { |th| th.children&.find(&:text?)&.text&.strip }
      next unless row_headers.any? { |title| tenses.include?(title) }

      forms = row.css('td').map do |cell|
        text = cell.text.strip.gsub(/\s+/, ' ') # Remove extra spaces
        next nil if text.empty? || text == '—'

        # Split the forms if multiple are in a single cell
        text.split(',').first.strip.gsub(/\[.*?\]/, '').gsub(/\(.*?\)/, '').strip
      end.compact

      extracted_rows << forms unless forms.empty?
    end
    extracted_rows
  end

  def format_line(raw_line, supine:, use_supine:, is_last:)
    line = if use_supine
             "  #{raw_line.map { |aux| "#{supine}#{aux}" }}"
           else
             "  %w[#{raw_line.join(' ')}]"
           end
    line += ',' unless is_last
    line
  end
end
