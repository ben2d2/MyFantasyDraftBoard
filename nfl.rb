require('csv')
class QBS 
	
array = []
i = 0
CSV.open('quarterbacks.csv', 'r') do |row|
	players = array << [row]
	qb_col1 = players[i][0][0]
	qb_col2 = players[i][0][1]
	qb_col3 = players[i][0][2]
	qb_col4 = players[i][0][3]
	qb_col5 = players[i][0][4]
	qb_col6 = players[i][0][5]

	quarterbacks = "   ", qb_col6.to_s.ljust(30), " | ", qb_col5.to_s.center(10), " | ", qb_col2.to_s.center(10), " | ", qb_col3.to_s.center(10), " | ", qb_col4.to_s.center(10), " | "
	if players == nil
		else
			print quarterbacks , "\n"
		end
		i += 1
	end
end
