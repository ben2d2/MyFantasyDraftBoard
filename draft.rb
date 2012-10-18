
require ('./lib/players.rb')
require ('./lib/search.rb')
require ('colorize') 

def read_my_list_csv
  my_list_csv = []
  CSV.foreach("files/my_list.csv") do |row|
    my_list_csv += [row]
  end
  my_list_csv
end

def first_prompt
  puts
  puts "Welcome to My Fantasy Draft Board Builder!".colorize( :blue )
  puts "Please review your current draft wish list".colorize( :blue )
  puts "and make additions by following the steps".colorize( :blue )
  puts "at each prompt:".colorize( :blue )
  puts

  puts "My Fantasy Wish List".colorize( :white ).colorize( :background => :red )
  read_my_list_csv.each { |a| print a[0].upcase.colorize( :red ), " - ", a[6].colorize( :red ), "\n"}
  puts 

  puts "Using the search terms listed below, please enter a player position to begin your search.".colorize( :green )
  puts "Positions search terms:".colorize( :green )
  puts "Offense: qbs - quarterbacks | rbs - runningbacks | wrs - widereceivers | tes - tightends".colorize( :blue )
  puts "Defense: dfl - defensiveline | dfb - defensivebacks | lbs - linebackers".colorize( :blue )
  puts "Kicking: krs - kickers | ptr - punters | krt - kickreturnteams".colorize( :blue )
  puts

  print "Enter selection here:".colorize( :blue )
  @pos_arg = gets.chomp!
  
  second_prompt
end

def second_prompt
  puts "Select all, top10, sort by name, sort by age, older than, younger than, select, or quit:".colorize( :blue )
  @second_prompt = gets.chomp!
  
  if @second_prompt == "quit"
    puts "Thanks for joining us! Goodbye."
    require ('./lib/nfl_logo')
    exit
  else
    print_list
  end

end

def third_prompt
  puts "My Fantasy Wish List".colorize( :white ).colorize( :background => :red )
  read_my_list_csv.each { |a| print a[0].upcase.colorize( :red ), " - ", a[6].colorize( :red ), "\n"}
  puts "You may continue to browse each player position by entering a command term below.".colorize( :green )
  puts
  puts "ref - to refine your search at given position".colorize( :blue )
  puts "sel - select player by rank no.".colorize( :blue )
  puts "new - to enter a new skill position to search".colorize( :blue )

  puts "quit - to exit program".colorize( :blue )
  answer = gets.chomp.downcase

  case answer
  when /^sel/
    print "Enter rank no. for the player to select:".colorize( :blue )
    rank_no = gets.chomp!
    play_list = Players.new(@pos_arg)
    play_list.select_one_player(rank_no)
    third_prompt
  when /^new/
    first_prompt
  when /^ref/
   second_prompt
  when /^quit/
    puts "Thanks for joining us! Goodbye."
    require ('./lib/nfl_logo')
    exit
  else
    third_prompt
  end
end

def print_list
  play_list = Players.new(@pos_arg)

  case @second_prompt.chomp.downcase
  when "top10"
    play_list.top_ten_players

  when "all"
    play_list.all_at_position

  when "older than"
    print "Enter age for #{@pos_arg} #{@second_prompt}:".colorize( :blue )
    age_arg = gets.chomp!
    play_list.older_than_age(age_arg)

  when "younger than"
    print "Enter age for #{@pos_arg} #{@second_prompt}:".colorize( :blue )
    age_arg = gets.chomp!
    play_list.younger_than_age(age_arg)

  when "sort by name", "sort by age"
    print "Enter ASC or DESC:".colorize( :blue )
    order = gets.chomp!
    play_list.sort(@second_prompt, order)
  
  when "select", "sel"
    print "Enter rank no. for the player to select:".colorize( :blue )
    rank_no = gets.chomp!
    play_list.select_one_player(rank_no)
  end

  third_prompt
end
  
first_prompt