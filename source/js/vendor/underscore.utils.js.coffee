# extend underscore with some string helper methods
_.mixin
  htmlEncode: (value) ->
    $('<div/>').text(value).html()

  htmlDecode: (value) ->
    $('<div/>').html(value).text()

  # take a number and formats it with delimiters
  # "1000" => "1,000"
  format_with_delimiter: (value, delimiter) ->
    delimiter = delimiter || ","
    amount = input.toString()
    a = amount.split('.', 2)
    d = a[1]
    i = parseInt(a[0], 10)
    return '' if isNaN(i)

    minus = ''
    minus = '-' if i < 0
    i = Math.abs(i);

    n = new String(i)
    a = []
    while n.length > 3
      nn = n.substr(n.length-3)
      a.unshift(nn)
      n = n.substr(0,n.length-3)

    a.unshift(n) if n.length > 0
    n = a.join(delimiter)

    if d && d.length > 0
      amount = n + '.' + d;
    else
      amount = n

    amount = minus + amount
    return amount

  autolink: (value, options...) ->
    url_pattern =
      /(\b(https?):\/\/[\-A-Z0-9+&@#\/%?=~_|!:,.;]*[\-A-Z0-9+&@#\/%=~_|])/ig

    if options.length > 0
      link_attributes = ''

      for key, value of options[0]
        link_attributes += " #{key}='#{value}'"

      value.replace url_pattern, "<a href='$1' " + link_attributes.trim() + ">$1</a>"

    else
      value.replace url_pattern, "<a href='$1'>$1</a>"
