class ScrapingTwitter

  attr_reader :student_twitters, :student_tweets 

  def initialize
    @student_twitters = Student.all.collect{|student| student.twitter}
  end

  def student_tweets 
    student_tweets = @student_twitters.collect do |twitter_profile|
      page = Nokogiri::HTML(open("#{twitter_profile}"))
      tweets = page.search("p.ProfileTweet-text").collect{|tweet| tweet.text.strip}.flatten[0]
    end 
  end   

  def create_tweet_instances
    student_tweets.collect {|tweets| Twitter.new(student_tweets)}
  end   

end  