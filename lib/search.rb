require 'csv'
require ('colorize') 

def load_file(path_to_csv)
  @players = []
  @path = path_to_csv
  csv_contents = CSV.read(path_to_csv)
  csv_contents.each do |row|
    @players << row[5]
  end
  @players.each { |p| p.downcase! }
end

def search_for_player
  puts "My Fantasy Wish List".colorize( :white ).colorize( :background => :red )
  read_my_list_csv.sort_by { |a| [0].collect { |i| print a[i].upcase.colorize( :red ), "\n" } }
  puts @file.upcase
  print "Enter name of #{@file} to search for: "

  @player = gets.chomp
  if @player == "new"
    first_prompt
  else

  @results = [@players.grep(/#{@player}/)]
  if @results
    @results.each { |p| puts p }
    ans_prompt
  else
    puts "Nothing found."
    ans_prompt
  end
end
end



  def read_my_list_csv
    my_list_csv = []
    CSV.foreach("files/my_list.csv") do |row|
     my_list_csv += [row]
    end
     my_list_csv
  end

def search_prompt

if @pos_arg != nil && @player == nil
  @file = @pos_arg
else
puts "My Fantasy Wish List".colorize( :white ).colorize( :background => :red )
read_my_list_csv.sort_by { |a| [0].collect { |i| print a[i].upcase.colorize( :red ), "\n" } }
print "\n"
puts "Using the search terms listed below, please enter a player position to begin your search.".colorize( :blue )
puts "Positions search terms:".colorize( :blue )
puts "Offense: quarterbacks | runningbacks | widereceivers | tightends".colorize( :blue )
puts "Defense: defensiveline | defensivebacks | linebackers".colorize( :blue )
puts "Kicking: kickers | punters | kickreturnteams".colorize( :blue )
print "\n"
print "Enter selection here:".colorize( :green )
@file = gets.chomp!
if @file == "new"
  first_prompt
else
  @file
end
end

load_file("files/#{@file}.csv")
search_for_player
ans_prompt
end

def ans_prompt
  print "Search again or add to draft board? (y or n | add | start over) "
  answer = gets.chomp.downcase
  case answer
  when /^y/
     search_for_player
     ans_prompt
  # when /^add/
  #   add_to_list
  #   search_prompt
  when /^n/
    puts "Goodbye."
    exit
  # else
  #   search_prompt
  end

end