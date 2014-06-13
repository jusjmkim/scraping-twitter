class ScrapingTwitter
<<<<<<< HEAD:lib/scraping-twitter.rb
=======

  student_twitters = Array.new 
  student_profiles.each do |profile|
    page = Nokogiri::HTML(open("http://ruby005.students.flatironschool.com/#{profile}"))
    twitter_handle = page.search("div.social-icons").css("a").attribute("href").value
    student_twitters << twitter_handle
  end
  array_into_hash(:twitter, student_twitters, @@students)

  student_tweets = Array.new
  student_twitters.each do |twitter_profile|
    page = Nokogiri::HTML(open("http://twitter.com/#{twitter_profile}"))
    binding.pry 
    tweets = page.search("div.ProfileTweet-contents")
    student_tweets << tweets 
  end   
  array_into_hash(:tweets,student_tweets,@@students)

>>>>>>> scraping twitter:scraping-twitter.rb
end  