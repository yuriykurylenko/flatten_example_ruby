def flatten(a)
  raise ArgumentError, 'Argument should be an array' unless a.is_a?(Array)

  a.inject([]) do |res, el|
    tail = case el
             when Array
               flatten(el)
             when Integer
               [el]
             else
               raise ArgumentError, 'Elements of the nested array should be integers'
           end

    res + tail
  end
end
