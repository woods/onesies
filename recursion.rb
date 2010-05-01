# Experiment with Ruby's recursion limits

def recurse
  until (@depth += 1) >= @max do recurse end
end

1000.step(10_000, 1000) do |max|
  @max = max
  @depth = 0
  puts "Recursing #{@max} times..."
  begin
    recurse
  rescue SystemStackError
    puts "Stack level too deep at #{@depth}"
  end
end
