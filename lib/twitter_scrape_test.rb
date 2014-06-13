require 'nokogiri'
require 'open-uri'
require 'pry'

my_twitter = Nokogiri::HTML(open('https://twitter.com/_c_cal'))
a_tweet_i_hope = my_twitter.search("p.ProfileTweet-text").text

amber_twitter = Nokogiri::HTML(open('https://twitter.com/ambertunnell'))
ambers_tweets = amber_twitter.search("p.ProfileTweet-text").text

justins_twitter = Nokogiri::HTML(open('https://twitter.com/jusjmkim'))
justins_tweets = justins_twitter.search("p.ProfileTweet-text").text

binding.pry