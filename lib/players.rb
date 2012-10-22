require 'csv'
require 'colorize'
require './lib/player'
class Players
  attr_accessor :second_prompt, :sort, :order, :rank, :single_player

  def initialize(pos_arg)
    @position = pos_arg  
  end

  def get_file
      file = "files/#{@position}.csv"  
  end

  def array_from_csv
      array = []
      CSV.foreach(get_file) do |row|
        array += [Player.new(row)]
      end
      array
  end

  def all_at_position
      print_players_for_given_method(array_from_csv)
  end

  def top_ten_players
    results = array_from_csv.select { |player| player.rank.to_i <= 10 }
    print_players_for_given_method(results)
  end

  def older_than_age(age)
    results = array_from_csv.select { |player| player.age.to_i >= age.to_i }
    print_players_for_given_method(results)
  end

  def younger_than_age(age)
    #select gets all matches
  results = array_from_csv.select { |player| player.age.to_i <= age.to_i }
  print_players_for_given_method(results)

  end

  def select_one_player(rank)
    #find method seeks a specific match
    player = array_from_csv.find { |player| player.rank.to_i == rank.to_i }  
    print_players_for_given_method([player])
    puts "Type add to move player to your draft board or new to start over:".colorize( :blue )
    add = gets.chomp!
    if add == "add"
      CSV.open("files/my_list.csv", 'ab') do |csv|
        csv << [@position, *player.to_a]
      end
    else
      first_prompt
    end
  end

  def sort(sort, order)
    array_sorted = []
    if sort == "sort by name" && order == "ASC"
      array_sorted = array_from_csv.sort_by(&:name)
    elsif sort == "sort by name" && order == "DESC"
      array_sorted = array_from_csv.sort_by(&:name).reverse
    elsif sort == "sort by age" && order == "ASC"
      array_sorted = array_from_csv.sort_by { |player| player.age.to_i }
    elsif sort == "sort by age" && order == "DESC"
      array_sorted = array_from_csv.sort_by { |player| player.age.to_i }.reverse
    end
    print_players_for_given_method(array_sorted)
  end


  def column_headers
    offense = %w[qbs wrs rbs tes] #same as ["qbs", "wrs", "rbs"]
    defense = %w[lbs dfl dfb]
    kicking = %w[krs ptr]

    name = "Player Name"
    bye = "Team - Bye"
    age = "Age"

    case @position
    when *offense
        points = "Points"
        ppg = "PPG"
        
    when *defense
        points = "Tackles"
        ppg = "TPG"

    when *kicking
        points = "Kicks"
        ppg = "KPG"

    when "krt"
        name = "Team Name"
        bye = "Team - Bye"
        points = "Kicks"
        ppg = "KPG"
    end
    ["Rank".ljust(6), name.ljust(35), bye.center(10), points.center(10), ppg.center(10), age.center(10), ""].join(" | ")
  end

  def print_players_for_given_method(players)
    puts
    puts @position.upcase
    puts column_headers
    players.each do |player|
      player_line = [player.rank.to_s.rjust(6), 
                    player.name.to_s.ljust(35), 
                    player.bye.to_s.center(10), 
                    player.points.to_s.center(10), 
                    player.ppg.to_s.center(10), 
                    player.age.to_s.center(10), 
                    ""].join(" | ")
      puts player_line 
    end
  end
end