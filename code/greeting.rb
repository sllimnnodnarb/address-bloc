def greet_them
  greeting = ARGV.shift
  ARGV.each do |greeted|
    puts "#{greeting} #{greeted}"
  end
end
greet_them
