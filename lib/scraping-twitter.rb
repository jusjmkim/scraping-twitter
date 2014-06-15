class ScrapingTwitter

  attr_reader :student_twitters, :student_tweets, :time_stamp

  def initialize
    @student_twitters = Student.all.collect{|student| student.twitter}
    student_tweets
    create_tweet_instances
  end

  def student_tweets
    student_tweets ||= @student_twitters.collect do |twitter_profile|
      page = Nokogiri::HTML(open("#{twitter_profile}"))
      tweets = page.search("p.ProfileTweet-text").collect{|tweet| tweet.text.strip}.flatten[0]
    end
  end

  def time_stamp
    time_stamps ||= @student_twitters.collect do |twitter_profile|
      page = Nokogiri::HTML(open("#{twitter_profile}"))
      time_stamp = page.search("span.js-short-timestamp").collect{|stamp| stamp.attribute("data-time").value}
    end
  end

  def create_tweet_instances
    student_tweets.collect {|tweets| Twitter.new(student_tweets, time_stamp)}
  end   

end