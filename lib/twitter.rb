class Twitter

  attr_accessor :keyword 
  attr_reader :student_tweets

  @@all = []

  def self.all
    @@all
  end

  def initialize(student_tweets)
    @student_tweets = student_tweets
    @@all << self 
  end   

  def number_of_tweets 
    @student_tweets.length 
  end

  def tweets_that_include(word)
    word_array = @student_tweets.collect{|tweet| tweet if tweet.split(" ").include?(word)}.compact
  end   
    
end 