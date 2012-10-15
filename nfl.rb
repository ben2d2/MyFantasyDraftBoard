Shoes.app :title => "My Fantasy Draft Board",
:width => 550,
:height => 545 do

# background darkslategray..lightsteelblue
background "NFL.png"


stack do
	background cornflowerblue..skyblue
	subtitle "My Fantasy Draft Board"
end

require ('csv')

flow do
	para "Select a skill position:"
	@position = list_box :items => ["Quarterbacks", "Running Backs", "Wide Receivers", "Top Ten Quarterbacks", "Top Ten Running Backs", "Top Ten Wide Receivers"]
	button "GO" do

		pos = @position.text
		if pos == "Quarterbacks" || pos == "Top Ten Quarterbacks"
		file = "quarterbacks.csv"
		elsif pos == "Running Backs" || pos == "Top Ten Running Backs"
		file = "running_backs.csv"
		elsif pos == "Wide Receivers" || pos == "Top Ten Wide Receivers"
		file = "wide_receivers.csv"
		end
	stack do
		background indianred..lightcoral,
		:height => 28
		caption pos
	end
		array = []
		i = 0
		player = CSV.parse(File.read(file))
		if pos == "Top Ten Quarterbacks" || pos == "Top Ten Running Backs" || pos == "Top Ten Wide Receivers"
			n = 11
		else
		n = player.length
		end

		n.times do

		cat = player[i][0]
		if player[i][1] == nil
			pts = " "
		else
			pts = player[i][1]
		end
		if player[i][2] == nil
			ppg = " "
		else
			ppg = player[i][2]
		end
		age = player[i][3]
		team_bye = player[i][4]
		name = player[i][5]

		if i%2 == 0
			bg = white
		elsif i%2 > 0
			bg = lightgrey
		end
		
		flow :width => "35%", :height => 24 do
		background bg
		para name
		end
		flow :width => "20%", :height => 24 do
		background bg
		para team_bye
		end
		flow :width => "15%", :height => 24 do
		background bg
		para pts
		end
		flow :width => "15%", :height => 24 do
		background bg
		para ppg
		end
		flow :width => "15%", :height => 24 do
		background bg
		para age, "\n" 
		end

		i += 1
		end

		stack do
		background cornflowerblue..skyblue
		inscription "Copyright © 2012 My Fantasy Draft Board"
		end
	end
end
end