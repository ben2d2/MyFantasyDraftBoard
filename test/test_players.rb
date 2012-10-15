require 'test/unit'
require 'players'

class PlayersTest < Test::Unit::TestCase
    
    def test_01a_get_file
        player = Players.new("quarterbacks")
        assert_equal("files/quarterbacks.csv",player.get_file)
    end
    
    def test_01b_get_file
        player = Players.new("toptentes")
        assert_equal("files/tight_ends.csv",player.get_file)
    end
    
    
    def test_01c_get_file
        player = Players.new("kick")
        assert_equal("files/kickers.csv",player.get_file)
    end

    def test_02a_all_at_position_array_length
        player = Players.new("quarterbacks")
        assert_equal(86,player.array_from_csv.length)        
    end

    def test_02b_all_at_position_array_length
        player = Players.new("kickers")
        assert_equal(35,player.array_from_csv.length)        
    end
    
    def test_03a_top_ten_quarterbacks
        player = Players.new("quarterbacks")
        assert_equal([["1)", "187.7", "11.7", "33", "NO -6", "Brees, Drew"],
          ["2)", "185.9", "12.4", "28", "GB -10", "Rodgers, Aaron"],
           ["3)", "171", "10.7", "35", "NE -9", "Brady, Tom"],
            ["4)", "154.3", "9.6", "23", "CAR-6", "Newton, Cam"],
             ["5)", "149.5", "9.3", "24", "DET-5", "Stafford, Matthew"],
              ["6)", "129.1", "8.1", "31", "NYG-11", "Manning, Eli"],
               ["7)", "127.5", "8", "32", "DAL-5", "Romo, Tony"],
                ["8)", "114.6", "7.2", "27", "ATL-7", "Ryan, Matt"],
                 ["9)", "114.6", "7.2", "30", "SD -7", "Rivers, Philip"],
                  ["10)", "108", "8.3", "32", "PHI-7", "Vick, Michael"]],player.top_ten_players)        
    end

    def test_03b_top_ten_punters_array_length
        player = Players.new("punters")
        assert_equal(10,player.top_ten_players.length)        
    end

    def test_04a_player_at_position_older_than_age_arg
        player = Players.new("rbs")
        assert_equal(40,player.older_than_age(25).length)
    end

    def test_04b_player_at_position_older_than_age_arg
        player = Players.new("qbs")
        assert_equal(21,player.older_than_age(30).length)
    end

    def test_05a_player_at_position_younger_than_age_arg
        player = Players.new("qbs")
        assert_equal(24,player.younger_than_age(25).length)
    end

    def test_05b_player_at_position_younger_than_age_arg
        player = Players.new("qbs")
        assert_equal(10,player.younger_than_age(23).length)
    end

    def test_06a_sort_player_by_name
        player = Players.new("kickers")
        assert_equal([[], []],player.sort("sortbyname", "ASC"))
    end

  end
