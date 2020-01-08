# PHASE 2
def convert_to_int(str)
  Integer(str)
rescue ArgumentError
  puts "Not a valid number"
  nil
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise NameError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue NameError
    if maybe_fruit == "coffee"
      retry
    end
    puts "Not a fruit or coffee"
  end

end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise "Years known too few" if yrs_known < 5
    raise ArgumentError, "Unknown Name" if name.length <= 0
    raise "Unknown Favorite Pastime" if fav_pastime.length <= 5

    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known} years. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go play #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


