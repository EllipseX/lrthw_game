# author: EllipseX
# D.o.C.: jan-3-2017
# purpose: Learn Ruby The Hard Way
# Desc: it's a shit game that is somewhat stable

choices = [] # maybe use this?
#prompt = "> "

puts "Who are you?"
$name = (gets).to_s
puts "Very well, welcome #{$name}\nNight has come."

# literally used once <3
$player_hp = 20

# bool loop commands
$day_time = false

$in_camp = true

$in_forest = false

$at_gate = false

$in_city = false

$in_boss = false

$boss_alive = true

##(the start of the game as well and campt method)
def camp
  puts "You're at your camp #{$name}what will you do?
  \n1: cook\n2: rest\n3: stare into the sky\n4: quit the game\n5: venture into the forest"
  answer1 = (gets).to_i

#cook option
  if answer1 == 1
      puts "Are you Vegan?\n1: yes\n2: no"
      vegan = (gets).to_i
      if vegan == 1
        puts "There are only animals around\nyou find the idea detestable."
        are_vegan = true
      elsif vegan == 2
        puts "You cook up a raspberry."
      else
        puts "yes was the only real option."
        are_vegan = true
      end

#rest option
  elsif answer1 == 2
      if $day_time == true
        puts "it's too bright out to sleep."
      else
        puts "you're too distracted by your thoughts\nit's daytime before you know it."
        $day_time = true
      end

#stare option
  elsif answer1 == 3
      if $day_time == true
        puts "You're eyes hurt"
      elsif $day_time == false
        puts "The stars look lovely tonight."
      else
        puts "You decided against it in the end."
      end

#quit option
  elsif answer1 == 4
    puts "Are you sure?\n1: yes\n2: no"
      @answer = (gets).to_i
        if @answer == 1
          $in_campt = false
          exit(0)
        elsif @answe == 2
          puts "all right"
        else
          puts "all right"
        end

#forest option
  elsif answer1 == 5
    puts "Off you go."
    $in_camp = false
    $in_forest = true
    forest
#default to forest
  else
    puts "off you go then."
    $in_camp = false
    $in_forest = true
    forest
  end

end

# check to make sure boss is alive or dead on entry into North(boss) option/method
# don't delete, infinitely respawns without it.
def check_boss
  if $boss_alive == true
    boss
  else
    puts "You already killed the boss, silly."
  end
end

## forest method
def forest
  $in_forest = true
	puts "You stand in the forest\nThere is something bright to the North, more forest to the East, your camp to the West, and a path to the South.\nWhat do you do? Go:\n1: North\n2: East\n3: South\n4: West\n5: Listen to the birds."
	answer2 = (gets).to_i

# how to access boss fight
	if answer2 == 1
    puts "You walk towards the light...\n"
    check_boss

# dead end
	elsif answer2 == 2
		puts "There's just more forest that way.\nYou make your way back."
		forest

# progress into game (maybe put secret kill item in town)
	elsif answer2 == 3
		puts "You walk down the path and find a gate.\nThe guard looks obnoxious..."
			$in_forest = false
			gate

# loop back to camp
	elsif answer2 == 4
		puts "You walk back into camp."
		$in_forest = false
		camp
		$in_camp = true

# just a simple dbza reference
	elsif answer2 == 5
		puts "You hear the birds chirping loudly.\nWhat should you do?\n1: Yell at them.\n2: Sing along."
		@answer = (gets).to_i
    # activaction key for reference
			if @answer == 1
				puts "You shout at the birds, suddenly, some shit falls on your shoulder."
			elsif @answer == 2
				puts "You sing along with the birds.\nThat's all."
			else
				puts "You stand there unsure what to feel."
			end

# default to loop back from
	else
		puts "You stand there."
	end

end

# boss fight method

def boss
  $in_forest = false
	$in_boss = true
	$boss_hp = 20

	puts "You've managed to find the end of the game.\nOh Dear.\nA boss stands before you."
	#boss dialogue
	puts "'Mortal, you stand before me...I will now berate you\nfor a short while at least.'"
	puts "Listen?\n1: Yes\n2: No"

	listen = (gets).to_i

# option to listen
	if listen == 1
		puts "Very well..."
		# add some length bullshit dialogue

# ignore boss options
	elsif listen == 2
		puts "'I-oh...'\nThe boss seems disappointed."
		$boss_hp -= 5

# default boss start option
	else
		puts "The fight begings."
	end
  $in_boss = false
# enters combat
	combat_mode

end

# combat method for boss fight
def combat_mode
	$in_combat = true
	######
  while $boss_alive do
  	puts "Fight me, coward!"
  	puts "#{$boss_hp} <-- their health"
  	puts "What do you do?\n1: attack\n2: call it a name\n3: listen to it talk\n4: leave"
  	@combat = (gets).to_i

  	if @combat == 1
  		puts "You strike the boss."
  		$boss_hp -= 7
  		puts $boss_hp
  	elsif @combat == 2
  		puts "You call them a really nasty name."
  		$boss_hp
  	elsif @combat == 3
  		puts "'Y-you mean it?'\nThey seem to be beaming with joy."
  		$boss_hp += 3
  	elsif @combat == 4
  	puts "You leave in the middle of their taunt.\n'H-How dare you!'\nThey seem upset.\nLeave anyway?\n1: Yes\n2: No"
  		leave = (gets).to_i

  			if leave == 1
  				puts "You walk away from the boss, their heart breaks and they die."
  				$boss_hp -= 40
  				puts "You win"
          $boss_alive = false
          win_fight
  			elsif leave == 2
  				puts "You decide to stay."
  			else
  				puts "You walk away anyway."
  				$in_combat = false
          $boss_hp -= 40
          win_fight
          $boss_alive = false
          $in_boss = false
  			end
# default + player damage option
  		else
  			puts "You get bored\nThe boss hits you."
  			$player_hp -= 1
  			puts $player_hp
# checks if player is still alive (you can't die)
          if $player_hp <= 0
            puts "They actually can't hurt you\n you were just being nice."
            $player_hp = 20
          else
# defaults back to game
          end
# end of 2nd layer if/else
        end
      end
    end

#kill boss win method
def win_fight
  if $boss_hp <= 0
    puts "You win!"
    $in_combat = false
    $in_boss = false
    $dead_boss = true #add a unique dialogue somewhere if this is true
    $in_forest = true
  end
end

# Gate area method
def gate
  $nice = nil
  $at_gate = true
  $in_forest = false
  puts "You stand outside of what looks to be a lovely city.\nThe guard before you appearsa to be staring at you.
  \nWhat do you do?\n1: Ask what they're looking at\n2: Tell them off\n3: Ignore them and proceed through the gate\n4: Turn back?"
    answer3 = (gets).to_i

    if answer3 == 1
      puts "You ask the guard what they're looking at\n
      'The sky' says the guard.\nYou shrug."
    elsif answer3 == 2
      puts "You ask what the fuck the guard is looking at\nThey seem to jerk awake\n'T-The sky!'\nYou roll your eyes and leave."
    elsif answer3 == 3
      puts "You ignore the guard and enter the city gate"
      $at_gate = false
      city
    elsif answer3 == 4
      puts "You turn back because fuck that noise."
      $at_gate = false
      $in_forest = true
    else
      puts "You stand there, still thinking."
    end
end

# city method
def city
  $at_gate = false
  $in_city = true

  puts "You enter the city...it looked a lot better from the outside.\n
  To your left is an inn, and to your right a shop, behind you is the gate.\n
  What will you do?\n1: enter the inn\n2: enter the shop\n3: leave."

  answer4 = (gets).to_i

  if answer4 == 1
    puts "You enter the in and are immediately told it is closed for repairs.\nDisappointed, you exit the inn."
  elsif answer4 == 2
    puts "You enter the shop\nThe shop owner shouts and flails wildly...\n...\nYou step back out,
    \nIt seemed like they were shouting about something up north."
      if $boss_alive == false
        puts "You shrug to yourself, thinking of how awful that boss fight was."
      elsif $boss_alive == true
        puts "You wonder if it would be a good idea to get check it out."
      else
        puts "Well, whatever."
      end
    elsif answer4 == 3
      puts "You step back out the gate."
      $at_gate = true
      $in_city = false
    else
      puts "You're still thinking."
      $in_city = true
    end
end

# start area loop
######### so I notice
def the_game

  until !$in_camp do
    camp
  end

  until !$in_forest do
  	forest
  end

  until !$in_boss do
    boss
  end

  until !$at_gate do
    gate
  end

  until !$in_city do
    city
  end

end

the_game
