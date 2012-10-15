require ('csv')
class Players

	def initialize(pos_arg)
		@pos_arg = pos_arg
		if ARGV[1] && ARGV[2]
		@sort = ARGV[1]
		@order = ARGV[2]
		elsif ARGV[1]
		@age_arg = ARGV[1]
		end
	end

	def get_file
		if ["quarterbacks", "toptenqbs", "qbs"].include? @pos_arg
		file = "files/quarterbacks.csv"
		@title = "Quarterbacks"
		elsif ["runningbacks", "toptenrbs", "rbs"].include? @pos_arg
		file = "files/running_backs.csv"
		@title = "Running Backs"
		elsif ["widereceivers", "toptenwrs", "wrs"].include? @pos_arg
		file = "files/wide_receivers.csv"
		@title = "Wide-Receivers"
		elsif ["tightends", "toptentes", "tes"].include? @pos_arg
		file = "files/tight_ends.csv"	
		@title = "Tight-Ends"
		elsif ["defensiveline", "toptendline", "dline"].include? @pos_arg
		file = "files/defensive_line.csv"	
		@title = "Defensive Line"
		elsif ["defensivebacks", "toptendbs", "dbs"].include? @pos_arg
		file = "files/defensive_backs.csv"	
		@title = "Defensive Backs"
		elsif ["linebackers", "toptenlbs", "lbs"].include? @pos_arg
		file = "files/linebackers.csv"	
		@title = "Line-Backers"
		elsif ["kickers", "toptenkick", "kick"].include? @pos_arg
		file = "files/kickers.csv"	
		@title = "Kickers"
		elsif ["punters", "toptenpunt", "punt"].include? @pos_arg
		file = "files/punters.csv"	
		@title = "Punters"
		elsif ["kickreturn", "toptenkrt", "krt"].include? @pos_arg
		file = "files/kick_return_teams.csv"	
		@title = "Kick Return Teams"
		end
		file
	end

	def array_from_csv
		array = []
		CSV.open(get_file, 'r') do |row|
		array += [row]
		end
		array
	end

	def top_ten_players
		i = 0
		top_ten = []
		array_from_csv.each do |pl|
			if i < 10
				top_ten += [pl]
			i += 1
			end
		end
		top_ten
	end	

	def older_than_age(age_arg)
		i = 0
		age_array = []
		array_from_csv.each do |pl|
			tmp_age = array_from_csv[i][3]
			if tmp_age.to_i > age_arg.to_i
				age_array += [pl]
			end
			i += 1
		end
		age_array

	end

	def younger_than_age(age_arg)
		i = 0
		age_array = []
		array_from_csv.each do |pl|
			tmp_age = array_from_csv[i][3]
			if tmp_age.to_i < age_arg.to_i
				age_array += [pl]
			end
			i += 1
		end
		age_array
	end

	def all_at_position
		all_players = []
		array_from_csv.each do |pl|
		all_players += [pl]
		end
		all_players
	end

	def sort(sort, order)
		#Very useful and sugary tip on sort array of arrays
		# http://stackoverflow.com/questions/2218032/how-to-sort-an-array-of-arrays-by-three-or-more-elements-ruby
		if @sort == "sortbyname" && @order == "ASC"
		array_sorted = array_from_csv.sort_by { |a| [5].collect { |i| a[i] } }
		elsif @sort == "sortbyname" && @order == "DESC"
		array_sorted = array_from_csv.sort_by { |a| [5].collect { |i| a[i] } }.reverse
		elsif @sort == "sortbyage" && @order == "ASC"
		array_sorted = array_from_csv.sort_by { |a| [3].collect { |i| a[i] } }
		elsif @sort == "sortbyage" && @order == "DESC"
		array_sorted = array_from_csv.sort_by { |a| [3].collect { |i| a[i] } }.reverse
	end
	array_sorted
	end

	def rename_array_for_print
		positions = ["quarterbacks", "widereceivers", "runningbacks", "tightends", "defensiveline", "defensivebacks", "linebackers", "kickers", "punters", "kickreturn"]
		topten = ["toptenqbs", "toptenwrs", "toptenrbs", "toptentes", "toptendline", "toptendbs", "toptenlbs", "toptenkick", "toptenpunt", "toptenkrt"]
		pos_abbr = ["qbs", "wrs", "rbs", "tes", "dline", "dbs", "lbs", "kick", "punt", "krt"]

		
		if @sort
			array = sort(@sort, @order)
		elsif positions.include? @pos_arg
			array = all_at_position
		elsif topten.include? @pos_arg
			array = top_ten_players
		elsif pos_abbr.include? @pos_arg
			array = older_than_age(@age_arg)
		end
		array
	end

	def set_headers
		offense = ["quarterbacks", "widereceivers", "runningbacks", "tightends", "toptenqbs", "toptenwrs", "toptenrbs", "toptentes", "qbs", "wrs", "rbs", "tes"]
		defense = ["toptendline", "toptendbs", "toptenlbs", "dline", "dbs", "lbs"]
		kicking = ["kickers", "punters", "kickreturn", "kick", "punt", "krt", "toptenkick", "toptenpunt", "toptenkrt"]

		if offense.include? @pos_arg
			name = "Player Name"
			bye = "Team - Bye"
			points = "Points"
			ppg = "PPG"
			age = "Age"
			
			elsif defense.include? @pos_arg
			name = "Player Name"
			bye = "Team - Bye"
			points = "Tackles"
			ppg = "TPG"
			age = "Age"	
		elsif kicking.include? @pos_arg
			name = "Player Name"
			bye = "Team - Bye"
			points = "Kicks"
			ppg = "KPG"
			age = "Age"
		end
		headers =  "   ",
			 name.to_s.ljust(35), " | ",
			 bye.to_s.center(10), " | ",
			  points.to_s.center(10), " | ",
			   ppg.to_s.center(10), " | ",
			    age.to_s.center(10), " | "

	end

	def print_players_for_given_method
		new_array = rename_array_for_print
		i = 0
		n = new_array.length
		print "\n", "   ", @title, "\n"
		print set_headers, "\n"
		n.times do
			list_no = new_array[i][0]
			points = new_array[i][1]
			ppg = new_array[i][2]
			age = new_array[i][3]
			bye = new_array[i][4]
			name = new_array[i][5]
			player = "   ",
			 name.to_s.ljust(35), " | ",
			 bye.to_s.center(10), " | ",
			  points.to_s.center(10), " | ",
			   ppg.to_s.center(10), " | ",
			    age.to_s.center(10), " | "	
		i += 1
		print player , "\n" 
		end
	end




end
