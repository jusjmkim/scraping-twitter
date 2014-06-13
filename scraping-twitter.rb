class ScrapingTwitter

  Student.all

  student_twitters = Student.all.collect{|student| student.twitter}

  student_tweets = Array.new
  student_twitters.each do |twitter_profile|
    page = Nokogiri::HTML(open("http://twitter.com/#{twitter_profile}"))
    binding.pry 
    tweets = page.search("div.ProfileTweet-contents")
    student_tweets << tweets 
  end   
  array_into_hash(:tweets,student_tweets,@@students)

end  