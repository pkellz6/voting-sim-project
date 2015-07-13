require './voter'
require './candidate'
require './campaign'

# -----------VOTERSIM-CLASS-----------
class VoterSim
  attr_accessor :candidate_array, :voter_array

  def initialize
    @candidate_array = []
    @voter_array = []
  end

# METHOD FOR AN INVALID ENTRY
#   while true
#   def invalid_choice
#         # puts "invalid Choice"
#         x = gets.chomp
#         if x =~ /\d/
#           main_menu_user_choice
#         else
#           break
#       end
#   end

  def intro
    sleep(1)
      puts "What would you like to do?"
  end

# DISPLAYS USER CHOICES FOR MENU
  def display_choices
      puts <<-END
      "Please select from the following choices:
      (C)reate, (L)ist, (U)pdate, (V)oter simulation, or (E)xit"
      END
  end

# METHOD FOR THE MAIN MENU
  def main_menu_user_choice
      user_choice = gets.chomp.downcase
  while  !(user_choice == "l") && !(user_choice == "c") && !(user_choice == "u") && !(user_choice == "v") && !(user_choice == "e")
        puts "Invalid Selection"
        spacer
        display_choices
        user_choice = gets.chomp.downcase
  end
      case user_choice
      when "c"
        puts <<-END
        "What would you like to create"
        Select
        (C) Candidate
        (V) Voter
        END
        character_choice = gets.chomp.downcase
        while  !(character_choice == "c") && !(character_choice == "v")
            puts "Invalid Selection"
            spacer
            display_choices
            character_choice = gets.chomp.downcase
        end
          case character_choice
          when "c"
            create_candidate
          when "v"
            create_voter
          end

      when "l"
        puts <<-END
        What list what you like to view
        (C)andidate list or (V)oter list
        END
        user_list = gets.chomp.downcase
  while  !(user_list == "c") && !(user_list == "v")
          puts "Invalid Selection"
          spacer
          display_choices
          user_list = gets.chomp.downcase
    end
        case user_list
        when "c"
          spacer
          list_candidate
        when "v"
          spacer
          list_voter
        end
      when "u"
        puts <<-END
        "Which kind of character would you like to update"
        (C)andidate or (V)oter
        END
        group_select = gets.chomp.downcase
    while  !(group_select == "c") && !(group_select == "v")
          puts "Invalid Selection"
          spacer
          display_choices
          group_select = gets.chomp.downcase
    end
          case group_select
          when "c"
            list_candidate
            update_candidate_name
          when "v"
            list_voter
            update_voter_name
          end
      when "v"
        campaign = Campaign.new(@candidate_array, @voter_array)
        campaign.voter_choice
        campaign.tally_votes
        campaign.election_winner
      when "e"
        exit_sim
      end
  end


  def create_candidate
    puts "What is your name"
    name = gets.chomp.capitalize
    puts <<-END
    What is your party affiliation:
    (D)emocrat or (R)epublican
    END
    party = gets.chomp.downcase
  while  !(party == "d") && !(party == "r")
      puts "Invalid Selection"
      spacer
      display_choices
      party = gets.chomp.downcase
  end
    case party
    when "d"
      name = Candidate.new(name,"Democrat")
    when "r"
      name = Candidate.new(name, "Republican")
    end
      @candidate_array << name
  end

# CREATE VOTER METHOD
  def create_voter
    puts "what is your name?"
    name = gets.chomp.capitalize
    puts <<-END
    What is your political view?
    (P)rogressive, (C)onservative, (L)ibertarian, (M)assachusetts Democrat, or (I)ndependent
    END
    politics = gets.chomp.downcase
  while  !(politics == "p") && !(politics == "c") && !(politics == "l") && !(politics == "m") && !(politics == "i")
      puts "Invalid Selection"
      spacer
      display_choices
      politics = gets.chomp.downcase
  end
    case politics
    when "p"
      name = Voter.new(name, "Progressive")
    when "c"
      name = Voter.new(name, "Conservative")
    when "l"
      name = Voter.new(name, "Libertarian")
    when "m"
      name = Voter.new(name, "Massachusetts Democrat")
    when "i"
      name = Voter.new(name, "Independent")
    end
      @voter_array.push name
  end

# LIST VOTER METHOD
  def list_voter
    @voter_array.each { |x|
    print x.name.capitalize + "-"
    puts x.politics}
    spacer
    puts
    display_choices
    main_menu_user_choice
end

# LIST CANDIDATE METHOD
  def list_candidate
    @candidate_array.each { |x|
    print x.name.capitalize + "-"
    puts x.party}
    spacer
    puts
    display_choices
    main_menu_user_choice
end

# SPACE METHOD
  def spacer
    puts " "
  end

# UPDATE CANDIDATE METHOD
  def update_candidate_name
    puts "Enter name as shown"
    candidate_name = gets.chomp.capitalize
    @candidate_array.each do |c|
    if c.name == candidate_name
        puts "I found it, please enter new name"
        new_name = gets.chomp
        puts <<-END
        What is your new party affiliation:
        (D)emocrat or (R)epublican
        END
        party = gets.chomp.downcase
    while  !(party == "d") && !(party == "r")
            puts "Invalid Selection"
            spacer
            display_choices
            party = gets.chomp.downcase
    end
        case party
        when "d"
          c.party = "Democrat"
        when "r"
          c.party = "Republican"
        end
        c.name = new_name
        puts "You have updated the following candidate"
        spacer
        print c.name.capitalize + "-"
        puts c.party
      else
        puts "That candidate does not exist, press enter to be directed to main menu"
        main_menu_user_choice
    end
  end
  end

# METHOD TO END THE APPLICATION
  def exit_sim
    puts "Thank you for running our voting sim, goodbye"
    exit(0)
  end

  def update_voter_name
    puts "Enter name as shown"
    voter_name = gets.chomp.capitalize
    @voter_array.each do |v|
    if v.name == voter_name
        puts "Name found. Please enter new name"
        new_name = gets.chomp
        puts <<-END
         "Enter new Political view"
         Please select the letter that reflects your political views?
        (P)rogressive, (C)onservative, (L)ibertarian, (M)assachusetts Democrat, or (I)ndependent
        END
        new_politics = gets.chomp.downcase
    while  !(new_politics == "p") && !(new_politics == "c") && !(new_politics == "l") && !(new_politics == "m") && !(new_politics == "i")
            puts "Invalid Selection"
            spacer
            display_choices
            new_politics = gets.chomp.downcase
    end
        case new_politics
        when "p"
          v.politics =  "Progressive"
        when "c"
          v.politics = "Conservative"
        when "l"
          v.politics = "Libertarian"
        when "m"
          v.politics = "Massachusetts Democrat"
        when "i"
          v.politics = "Independent"
        end
        v.name = new_name
        puts "You have updated the following voter"
        spacer
        print v.name.capitalize + "-"
        puts v.politics
      else
        puts "That voter does not exist, you are being directed to main menu"
        main_menu_user_choice
    end
    end
  end


# MEHTOD TO START THE GAME
  def start
  while true
    # start = VoterSim.new
    intro
    display_choices
    main_menu_user_choice
    spacer
  end
  end
end
