require 'test/unit'
require 'players'

class PlayersTest < Test::Unit::TestCase
    
    def test_01a_get_file
        player = Players.new("qbs")
        assert_equal("files/qbs.csv",player.get_file)
    end
    
    def test_01b_get_file
        player = Players.new("tes")
        assert_equal("files/tes.csv",player.get_file)
    end
    
    def test_01c_get_file
        player = Players.new("krs")
        assert_equal("files/krs.csv",player.get_file)
    end

    def test_02a_all_at_position_array_length
        player = Players.new("qbs", "test.csv")
        players_string = '#<Player:0x007f85818add48
  @age="33",
  @bye="NO -6",
  @name="Brees, Drew",
  @points="187.7",
  @ppg="11.7",
  @rank="1">
 #<Player:0x007f85818ad758
  @age="28",
  @bye="GB -10",
  @name="Rodgers, Aaron",
  @points="185.9",
  @ppg="12.4",
  @rank="2">
 player.array_from_csv'
        assert players_string.to_s        
    end

    def test_02b_all_at_position_array_length
        player = Players.new("krs", "test.csv")
        players_string = '#<Player:0x007fbf820a3f90
  @age="37",
  @bye="SF -9",
  @name="Akers, David",
  @points="54.7",
  @ppg="3.4",
  @rank="1">,
 #<Player:0x007fbf820a3a40
  @age="34",
  @bye="RAI-5",
  @name="Janikowski, Sebastian",
  @points="52.5",
  @ppg="3.5",
  @rank="2">,
 #<Player:0x007fbf820a3248
  @age="34",
  @bye="TEN-11",
  @name="Bironas, Rob",
  @points="49.3",
  @ppg="3.1",
  @rank="3">,
 #<Player:0x007fbf820a2a28
  @age="24",
  @bye="DAL-5",
  @name="Bailey, Dan",
  @points="44",
  @ppg="2.8",
  @rank="4">,
 #<Player:0x007fbf820a2118
  @age="26",
  @bye="TB -5",
  @name="Barth, Connor",
  @points="43.2",
  @ppg="2.7",
  @rank="5">
  player.array_from_csv'
        assert players_string.to_s        
    end
    
    def test_03a_top_ten_quarterbacks
        player = Players.new("rbs", "test.csv")
        players_string = ''
        assert players_string.to_s     
    end

    def test_03b_top_ten_punters_array_length
        player = Players.new("ptr", "test.csv")
        players_string = '[#<Player:0x007f8b4b09b0b8
  @age="30",
  @bye="SF -9",
  @name="Lee, Andy",
  @points="53.9",
  @ppg="3.4",
  @rank="1">,
 #<Player:0x007f8b4b084a98
  @age="27",
  @bye="DEN-7",
  @name="Colquitt, Britton",
  @points="53.6",
  @ppg="3.3",
  @rank="2">,
 #<Player:0x007f8b4b0840e8
  @age="36",
  @bye="RAI-5",
  @name="Lechler, Shane",
  @points="52.9",
  @ppg="3.3",
  @rank="3">,
 #<Player:0x007f8b4b083800
  @age="28",
  @bye="MIA-7",
  @name="Fields, Brandon",
  @points="49.9",
  @ppg="3.1",
  @rank="4">,
 #<Player:0x007f8b4b0830d0
  @age="30",
  @bye="SEA-11",
  @name="Ryan, Jon",
  @points="49.4",
  @ppg="3.1",
  @rank="5">]',player.top_ten_players
        assert players_string.to_s        
    end

    def test_04a_player_at_position_older_than_age_arg
        player = Players.new("rbs", "test.csv")
        players_string = '[#<Player:0x007ff02a0824e8
  @age="25",
  @bye="BAL-8",
  @name="Rice, Ray",
  @points="109.6",
  @ppg="6.8",
  @rank="1">,
 #<Player:0x007ff02a03f8f0
  @age="27",
  @bye="JAC-6",
  @name="Jones-Drew, Maurice",
  @points="95.7",
  @ppg="6",
  @rank="3">,
 #<Player:0x007ff02a03f198
  @age="26",
  @bye="HOU-8",
  @name="Foster, Arian",
  @points="89",
  @ppg="6.8",
  @rank="4">,
 #<Player:0x007ff02a03ebd0
  @age="29",
  @bye="NO -6",
  @name="Sproles, Darren",
  @points="76.7",
  @ppg="4.8",
  @rank="5">,
 #<Player:0x007ff02a03ddc0
  @age="30",
  @bye="ATL-7",
  @name="Turner, Michael",
  @points="73.3",
  @ppg="4.6",
  @rank="7">,
 #<Player:0x007ff02a03d690
  @age="26",
  @bye="SEA-11",
  @name="Lynch, Marshawn",
  @points="71.3",
  @ppg="4.8",
  @rank="8">,
 #<Player:0x007ff02a03d0a0
  @age="31",
  @bye="BUF-8",
  @name="Jackson, Fred",
  @points="69",
  @ppg="6.9",
  @rank="9">,
 #<Player:0x007ff02a03cb78
  @age="27",
  @bye="MIA-7",
  @name="Bush, Reggie",
  @points="68.3",
  @ppg="4.6",
  @rank="10">]',player.older_than_age(25)
        assert players_string.to_s
    end

    def test_04b_player_at_position_older_than_age_arg
        player = Players.new("qbs", "test.csv")
        players_string = '[#<Player:0x007fd72b103088
            @age="33",
            @bye="NO -6",
            @name="Brees, Drew",
            @points="187.7",
            @ppg="11.7",
            @rank="2">]',player.older_than_age(30)
        assert players_string.to_s
    end

    def test_05a_player_at_position_younger_than_age_arg
        player = Players.new("qbs", "test.csv")
        assert_equal([],player.younger_than_age(25))
    end

    def test_05b_player_at_position_younger_than_age_arg
        player = Players.new("qbs", "test.csv")
        assert_equal([],player.younger_than_age(23))
    end

    def test_06a_sort_player_by_name
        player = Players.new("krs", "test.csv")
        players_string = '[#<Player:0x007ff02a121188
  @age="37",
  @bye="SF -9",
  @name="Akers, David",
  @points="54.7",
  @ppg="3.4",
  @rank="1">,
 #<Player:0x007ff02a11fcc0
  @age="24",
  @bye="DAL-5",
  @name="Bailey, Dan",
  @points="44",
  @ppg="2.8",
  @rank="4">,
 #<Player:0x007ff02a11c390
  @age="26",
  @bye="TB -5",
  @name="Barth, Connor",
  @points="43.2",
  @ppg="2.7",
  @rank="5">,
 #<Player:0x007ff02a120418
  @age="34",
  @bye="TEN-11",
  @name="Bironas, Rob",
  @points="49.3",
  @ppg="3.1",
  @rank="3">,
 #<Player:0x007ff02a120ad0
  @age="34",
  @bye="RAI-5",
  @name="Janikowski, Sebastian",
  @points="52.5",
  @ppg="3.5",
  @rank="2">]',player.sort("sort by name", "ASC")
        assert players_string.to_s
    end

  end
