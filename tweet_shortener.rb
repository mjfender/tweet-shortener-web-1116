def dictionary
wordswap = {
  hello: "hi",
  to: "2",
  two: "2",
  too: "2",
  for: "4",
  four: "4",
  be: "b",
  you: "u",
  at: "@",
  and: "&"
}
end

def word_substituter(tweet)
  tweet_array = tweet.split(" ")
  tweet_array.collect! do |word|
    if dictionary.key?(word.downcase.to_sym)
      dictionary[word.downcase.to_sym]
    else
      word
    end
  end
  tweet_array.join(" ")
end


def bulk_tweet_shortener(array)
  bulk_tweets = array
  #puts bulk_tweets
  #puts bulk_tweets.size
  bulk_tweets.collect! do |tweet|
    word_substituter(tweet)
  end
  #puts bulk_tweets
  bulk_tweets.each do |tweet|
    puts tweet
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  selective_result = selective_tweet_shortener(tweet)
  if selective_result.length <= 140
    selective_result
  else
    "#{selective_result[0...137]}..."  
  end
end
