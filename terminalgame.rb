#downloaded from www.supertechexpert.com

def  prompt()
print "> "
end

def silver_room()
	puts "This room is full of silver coins. How much do you want?"

	prompt; next_move = gets.chomp
	if next_move.include? "0" or next_move.include? "1" or next_move.include? "3" or next_move.include? "5" or next_move.include? "7"
		how_much = next_move.to_i()
	else
		dead("Wrong number! You get nothing.")
	end

	if how_much < 50
		puts "Nice, you're not greedy, you win!"
		Process.exit(0)
	else
		dead("What a brilliant move!")
	end
end

def giraffe_room()
	puts "There is a giraffe here."
	puts "The giraffe has a bunch of bowls. You can respond with: take bowls"
	puts "A big 30 foot giraffe is in front of another door. "
	puts "How are you going to move the giraffe? You can respond with: taunt giraffe "
	giraffe_moved = false
	puts "You can get past easily but bravely by swinging across the room from a ceiling rope.
	To choose this response, at the prompt type in: rope away"
	door_bypass = true


	while true
		prompt; next_move = gets.chomp

		if next_move == "take bowls"
			dead("The giraffe looks at you then licks your hair getting honey all over it.")
		elsif next_move == "taunt giraffe" and not giraffe_moved
			puts "The giraffe has moved from the door. You can go through it now. At the prompt, type in: open door"
			giraffe_moved = true
		elsif next_move == "rope away" and door_bypass
			dead("The giraffe gets pissed off and chews your shirt off.")
		elsif next_move == "open door" and giraffe_moved
			silver_room
		else
			puts " I have no idea what that means."
		end
	end
end

def hotel_manor()
	puts " You are in giraffe Manor owned by the Carr-Hartley family, 
	along with eight Rothschild giraffes. If you choose this, type in: Rothschild giraffes "
 	puts "It is part of a 140 acre estate in the shadow of Mount Kilimanjaro in Kenya."
 	puts "Guests staying at the Manor are usually joined by the giraffes at breakfast. if you choose this, 
 	type in: Guest Manor"

	prompt; next_move = gets.chomp

	if next_move.include? "Rothschild"
		start()
	elsif next_move.include? "Guest"
		dead("Welcome new guest to the Manor! Hope you have a pleasant stay in Nairobi.")
	else
		hotel_manor()
	end
end

def dead(why)
	puts "#{why}  That's all!"
	Process.exit(0)
end

def start()
	puts "You are in an empty room."
	puts "There is a door to your right and left."
	puts "Which one do you take?"

	prompt; next_move = gets.chomp

	if next_move == "left"
		giraffe_room()
	elsif next_move == "right"
		hotel_manor()
	else
		dead("You walk around the manor until you find a comfortable room.")
	end
end

start()



