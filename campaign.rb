# -------------CAMPAIGN-CLASS----------
class Campaign
  attr_accessor :votes_republican, :votes_democrat, :candidates, :voters

  def initialize(candidates, voters)
    @votes_republican = 0
    @votes_democrat = 0
    @candidates = candidates
    @voters = voters
  end

# -------------VOTING-METHOD--------------
  def voter_choice
    @voters.each do |v|
      case v.politics
      when "Libertarian"
        if rand(1..100) <= 90
         v.vote_for = "Republican"
        else
          v.vote_for = "Democrat"
        end
      when "Conservative"
        if rand(1..100) <= 75
          v.vote_for = "Republican"
        else
          v.vote_for = "Democrat"
        end
      when "Independent"
        if rand(1..100) <= 50
          v.vote_for = "Republican"
        else
          v.vote_for = "Democrat"
        end
      when "Progressive"
        if rand(1..100) <= 25
          v.vote_for = "Republican"
        else
          v.vote_for = "Democrat"
        end
      when "Massachusetts Democrat"
        if rand(1..100) <= 10
          v.vote_for = "Republican"
        else
          v.vote_for = "Democrat"
        end
      end
    end
  end

# ------------TALLY-METHOD------------
  def tally_votes
    @voters.each do |v|
      if v.vote_for == "Republican"
        @votes_republican += 1
      else
        @votes_democrat += 1
      end

    end
  end

# ---------ELECTION-RESULT-METHOD--------
  def election_winner
    if @votes_republican > @votes_democrat
      puts "votes are being tallied up..."
      sleep(3)
      puts "Republicans win!!!!"
      puts
      puts
      sleep(2)
    else
      puts "votes are being tallied up..."
      sleep(3)
      puts "Democrats win!!!!"
      puts
      puts
      sleep(2)                                            
    end
  end
end
