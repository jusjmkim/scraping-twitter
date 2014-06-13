class ScrapingTwitter

  attr_reader :student_tweets 

  Student.all

  student_twitters = Student.all.collect{|student| student.twitter}

  student_tweets = student_twitters.collect do |twitter_profile|
    page = Nokogiri::HTML(open("http://twitter.com/#{twitter_profile}"))
    tweets = page.search("div.ProfileTweet-contents")
  end   

end  