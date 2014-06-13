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

  def keyword_count(keyword)
    keyword_array = @student_tweets.split(" ").collect{|word| word if word == keyword}.compact
    keyword_array.length
  end   
    
end 