require 'pry'

class Player
  attr_accessor :move, :name, :score, :history, :weights

  def initialize
    @move = nil
    set_name
    @score = 0
    @history = History.new
  end
end

class History
  attr_accessor :move_history

  def initialize
     @move_history = []
  end

  def update_history(move)
    @move_history << move
  end

  def display
    @move_history.join(', ')
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors']

  WINNING_MOVES = { 'rock' => ['scissors','lizard'],
                  'paper'=> ['rock','spock'],
                  'scissors' => ['paper','lizard'],
                  'spock' => ['rock','scissors'],
                  'lizard' => ['spock','paper']
                  }

  LOSING_MOVES = { 'rock'=> ['paper','spock'],
                  'paper' =>['scissors','lizard'],
                  'scissors'=> ['rock','spock'],
                  'spock' => ['paper', 'lizard'],
                  'lizard' => ['scissors', 'spock']
                 }

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    WINNING_MOVES[to_s].include?(other_move.to_s)
  end

  def <(other_move)
    LOSING_MOVES[to_s].include?(other_move.to_s)
  end

  def to_s
    @value
  end
end

class Rule
  def initialize
    # not sure what the "state" of a rule object should be
  end
end

# not sure where "compare" goes yet
def compare(move1, move2)end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What is your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, you must enter a name."
    end
    self.name = n # can i use @name here?
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper or scissors."
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', "Robot 1"].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  WINNING_SCORE = 5

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts " Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose: #{human.move}"
    puts "#{computer.name} chose: #{computer.move}"
  end

  def determine_round_winner
    winner = nil
    if human.move > computer.move
      winner = human.name
    elsif human.move < computer.move
      winner = computer.name
    else
      nil
    end
    winner
  end

  def display_winner
    if determine_round_winner == nil
      puts "It's a tie"
    else
      puts "#{determine_round_winner.to_s} won this round!"
    end
  end

  def increment_score
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    end
  end

  def display_score
    puts "#{computer.name}'s score is #{computer.score}"
    puts "#{human.name}'s score is #{human.score}"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again?"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def display_final_winner
     winner = nil
     if human.score > computer.score
       winner = human.name
     elsif computer.score > human.score
       winner = computer.name
     else
       winner = "Its a tie"
     end
  end

  def display_final_score
    if game_over?
      puts "#{display_final_winner} is the WINNER"
    end
  end

  def reset_score
    if game_over?
      human.score = 0
      computer.score = 0
    end
  end

  def game_over?
    human.score >= WINNING_SCORE || computer.score >= WINNING_SCORE
  end

  def update_history
     human.history.update_history(human.move)
     computer.history.update_history(computer.move)
  end

  def display_history
     puts "------------------------------------"
     puts "#{human.name}'s History of moves is:"
     puts " #{human.history.display}"
     puts "- - - - - - - - - - - - - - - - - - - "
     puts "#{computer.name}'s History of moves is"
     puts "#{computer.history.display}"
     puts "------------------------------------"
  end

  def show_history
    answer = 'n'
    if computer.score >= 3 || human.score >= 3
      loop do
        puts "Do you want to review the game history?"
        answer = gets.chomp
        break if ['y', 'n'].include? answer.downcase
        puts "Sorry, must be y or n."
      end
    end

    answer.downcase == 'y' ? display_history :  false
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      increment_score
      display_score
      display_final_score
      reset_score
      update_history
      show_history
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
