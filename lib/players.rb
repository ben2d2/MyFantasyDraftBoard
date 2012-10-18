require ('csv')
require ('colorize') 
class Players
  attr_accessor :second_prompt, :sort, :order, :rank_no, :single_player

  def initialize(pos_arg)
    @pos_arg = pos_arg  
  end

  def get_file
      file = "files/#{@pos_arg}.csv"  
  end

  def array_from_csv
      array = []
      CSV.foreach(get_file) do |row|
        array += [row]
      end
      array
  end

  def all_at_position
      print_players_for_given_method(array_from_csv)
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
  print_players_for_given_method(top_ten)
  end 

  def older_than_age(age_arg)
      i = 0
      age_array = []
      array_from_csv.each do |pl|
          tmp_age = array_from_csv[i][3]
          if tmp_age.to_i >= age_arg.to_i
              age_array += [pl]
          end
          i += 1
      end
  print_players_for_given_method(age_array)
  end

  def younger_than_age(age_arg)
      i = 0
      age_array = []
      array_from_csv.each do |pl|
          tmp_age = array_from_csv[i][3]
          if tmp_age.to_i <= age_arg.to_i
              age_array += [pl]
          end
          i += 1
      end
  print_players_for_given_method(age_array)

  end

  def select_one_player(rank_no)
      i = 0
      @single_player = []
      array_from_csv.each do |pl|
          tmp_rank = array_from_csv[i][0]
          if tmp_rank.to_i == rank_no.to_i
              @single_player += [pl]
          end
      i += 1
      end
    print_players_for_given_method(@single_player)
    puts "Type add to move player to your draft board or new to start over:".colorize( :blue )
    add = gets.chomp!
    if add == "add"
    CSV.open("files/my_list.csv", 'ab') do |csv|
      @single_player.each do |i|
      csv << [@pos_arg, i[0], i[1], i[2], i[3], i[4], i[5]]
          end
      end
  else
      first_prompt
  end
  end

  def sort(sort, order)
      #Very useful tip on sort array of arrays
      # http://stackoverflow.com/questions/2218032/how-to-sort-an-array-of-arrays-by-three-or-more-elements-ruby
      if sort == "sort by name" && order == "ASC"
      array_sorted = array_from_csv.sort_by { |a| [5].collect { |i| a[i] } }
      elsif sort == "sort by name" && order == "DESC"
      array_sorted = array_from_csv.sort_by { |a| [5].collect { |i| a[i] } }.reverse
      elsif sort == "sort by age" && order == "ASC"
      array_sorted = array_from_csv.sort_by { |a| [3].collect { |i| a[i] } }
      elsif sort == "sort by age" && order == "DESC"
      array_sorted = array_from_csv.sort_by { |a| [3].collect { |i| a[i] } }.reverse
  end
  print_players_for_given_method(array_sorted)
  end


  def set_headers
      offense = ["qbs", "wrs", "rbs", "tes"]
      defense = ["lbs", "dfl", "dfb"]
      kicking = ["krs", "ptr"]

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

      elsif ["krt"].include? @pos_arg
          name = "Team Name"
          bye = "Team - Bye"
          points = "Kicks"
          ppg = "KPG"
      end
      "Rank".ljust(6), name.to_s.ljust(35), bye.to_s.center(10), points.to_s.center(10), ppg.to_s.center(10), ""
  end

  def print_players_for_given_method(array)
    n = array.length
    puts
    puts @pos_arg.upcase
    puts set_headers.join(" | ")
    n.times do |i|
      rank = array[i][0]
      points = array[i][1]
      ppg = array[i][2]
      age = array[i][3]
      bye = array[i][4]
      name = array[i][5]
      player = rank.to_s.rjust(6), name.to_s.ljust(35), bye.to_s.center(10), points.to_s.center(10), ppg.to_s.center(10), age.to_s.center(10), ""
      puts player.join(" | ") 
    end
  end
end