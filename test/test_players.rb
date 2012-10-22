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
        player = Players.new("qbs")
        assert_equal(86,player.array_from_csv.length)        
    end

    def test_02b_all_at_position_array_length
        player = Players.new("krs")
        assert_equal(35,player.array_from_csv.length)        
    end
    
    def test_03a_top_ten_quarterbacks
        player = Players.new("qbs")
        assert_equal(10,player.top_ten_players.length)        
    end

    def test_03b_top_ten_punters_array_length
        player = Players.new("ptr")
        assert_equal(10,player.top_ten_players.length)        
    end

    def test_04a_player_at_position_older_than_age_arg
        player = Players.new("rbs")
        assert_equal(57,player.older_than_age(25).length)
    end

    def test_04b_player_at_position_older_than_age_arg
        player = Players.new("qbs")
        assert_equal(26,player.older_than_age(30).length)
    end

    def test_05a_player_at_position_younger_than_age_arg
        player = Players.new("qbs")
        assert_equal(31,player.younger_than_age(25).length)
    end

    def test_05b_player_at_position_younger_than_age_arg
        player = Players.new("qbs")
        assert_equal(13,player.younger_than_age(23).length)
    end

    def test_06a_sort_player_by_name
        player = Players.new("krs")
        assert_equal(35,player.sort("sort by name", "ASC").length)
    end

  end
