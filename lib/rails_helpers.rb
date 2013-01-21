module RailsHelpers
  def number_with_delimiter(number, *args)
    options = args.extract_options!
    options.symbolize_keys!

    defaults = I18n.translate(:number.format, :locale => options[:locale], :raise => true) rescue {}

    unless args.empty?
      ActiveSupport::Deprecation.warn('number_with_delimiter takes an option hash ' +
        'instead of separate delimiter and precision arguments.', caller)
      delimiter = args[0] || defaults[:delimiter]
      separator = args[1] || defaults[:separator]
    end

    delimiter ||= (options[:delimiter] || defaults[:delimiter])
    separator ||= (options[:separator] || defaults[:separator])

    begin
      parts = number.to_s.split('.')
      parts[0].gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1#{delimiter}")
      parts.join(separator)
    rescue
      number
    end
  end
end