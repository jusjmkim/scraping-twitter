require_relative './spec_helper'

describe ScrapingTwitter do
  # Testing with Chris's Twitter
   let!(:twitter_scrape){ScrapingTwitter.new}

  describe "#initialize" do
    it "contains twitter of student instance" do
      expect(twitter_scrape.student_twitters[17]).to eq("https://twitter.com/_c_cal")
    end
  end

  describe "#student_tweets" do
    it "contains tweets of students" do
      expect(twitter_scrape.student_tweets[17]).to eq("New blog post about using abstraction and hashes to sort a music collection http://callahanchris.github.io/blog/2014/06/09/abstraction-and-music-library-sorting/ … @aviflombaum")
    end
  end

  describe "#create_tweet_instances" do
    it "should make an array of twitter instances" do
      expect(twitter_scrape.create_tweet_instances.first).to be_an_instance_of(Twitter)
    end
  end

end