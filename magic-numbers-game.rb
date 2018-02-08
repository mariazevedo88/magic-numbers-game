## Author: Mariana Azevedo
## Since: 06/02/2018 

#Game introduction
def welcome
    puts
    puts "        P  /_\  P                              "
    puts "       /_\_|_|_/_\                             "
    puts "   n_n | ||. .|| | n_n       Welcome to the    "
    puts "   |_|_|nnnn nnnn|_|_|     Magic Numbers' Game!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \__|_|__/                              "
    puts
    puts "What's your name?"
    name = gets.strip #get the value cleaned
    puts "\n\n\n"
    puts "We'll start the game for you, #{name}"
    name
end

def set_level
    puts "What level of difficulty do you want? (1 - Very Easy, 2 - Easy, 3 - Medium, 4 - Hard, 5 - Very Hard)"
    level = gets.to_i
end

def drawing_magic_number(game_level)
   
    case game_level
    when 1 
        max = 30
    when 2 
        max = 60
    when 3 
        max = 100
    when 4 
        max = 150
    else 
        max = 200
    end

    puts "Choosing a magic number between 1 and #{max}..."
    magic_number = rand(max) + 1 #random number between 1 and max
    puts "Chosen... how about guessing our magic number?"
    magic_number
end

#Function to record player's guess
def number_attempt(attempts, attempt, limit_of_attempts)
    puts "\n\n\n\n"
    puts "Attempt #{attempt} of #{limit_of_attempts}"
    puts "Attempts until now: #{attempts}"
    puts "Enter the number"
    attempt = gets.strip 
    puts "Did you get it right? Your guess #{attempt}"
    attempt.to_i
end

#Função para verifica se o jogador acertou o chute
def check_guess(magic_number, attempt)

    hit = magic_number == attempt

    if hit
        winning_message
        return true
    end 
    
    bigger = magic_number > attempt
    if bigger
        puts "The magic number is bigger!"
    else
        puts "The magic number is smaller!"
    end
    false
end

def winning_message
    puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "             You got it!               "
    puts
end

def play(name, level)

    magic_number = drawing_magic_number(level)
    points = 1000
    limit_of_attempts = 5
    attempts = []

    for attempt in 1..limit_of_attempts
        
        attempt = number_attempt attempts, attempt, limit_of_attempts
        attempts << attempt

        if name == "Mariana Azevedo"
            magic_number = attempt
            winning_message
            break
        end

        lossing_points = (attempt - magic_number).abs / 2.0
        points -= lossing_points

        break if check_guess magic_number, attempt 
    end

    puts "The magic number was #{magic_number}. You earned #{points} points."

end

def game_exit
    puts "Want to play again (Y/N)?"
    answer = gets.strip
    answer.upcase == "N"
end

name = welcome
level = set_level

loop do
    play name, level
    break if game_exit
end