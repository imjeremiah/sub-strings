def substrings(phrase, dictionary)
  subs_count = {}
  word_subs = []
  phrase_words = phrase.split(" ")

  while phrase_words.length > 0 do
    word = phrase_words[-1].downcase.gsub(/[^0-9a-z ]/i, '')
    word_pop = word.split("")
    word_shift = word.split("")

    while word_pop.length > 0 do
      word_subs.push(word_pop.join(""))
      word_subs.push(word_shift.join(""))
      letter = word_pop.pop
      word_subs.push(letter)
      word_shift.shift
    end
    
    word_subs = word_subs.uniq

    dictionary.each do |word| 
      word_subs.each do |sub|
        if word == sub
          subs_count[word] ||= 0
          subs_count[word] += 1
        end
      end
    end
    word_subs = []
    phrase_words.pop
  end

  p subs_count
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("below", dictionary) 
substrings("Howdy partner, sit down! How's it going?", dictionary) 