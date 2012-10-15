require ('lib/players.rb')
pos_arg = ARGV[0]
if ARGV[1] == "sortbyname" || ARGV[1] == "sortbyage"
	sort = ARGV[1]
	order = ARGV[2]
elsif  ARGV[1] == nil
else
age_arg = ARGV[1]
end

play_list = Players.new(pos_arg)
print play_list.print_players_for_given_method

