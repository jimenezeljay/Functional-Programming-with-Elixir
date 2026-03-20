defmodule SentenceAnalyzerProject do
  @moduledoc """
  Documentation for `SentenceAnalyzerProject`.
  """
  #entry point for the IO.puts to be
  def main do
   text = "Hello, world! This is a test sentence. How many words are here? Word Word Word Word"

   #word count
   wc = count_words(text)
   #sentence count
   sc = count_sentences(text)
   #top words
    tw = top_words(text)

    #what the output will look like when I run mix.bat
    IO.puts("Word Count: #{wc}")
    IO.puts("Sentence Count: #{sc}")
    IO.puts("Top Words: #{inspect(tw)}")
  end


#pure functions

  #this converts string to list first and then counts the words using recursion, which is more in line with functional programming principles
  def count_words(text) when is_binary(text) do
    text
    |> String.split()
    |> count_words()
  end

  #base case where empty the list = 0 words
  def count_words([]) do
    0
  end

  # recursive case where we take the head of the list and add 1 for each word, then call count_words on the tail of the list
  def count_words([_head | tail]) do
    1 + count_words(tail)
  end

  #regex pattern to split sentences based on punctuation marks
  def count_sentences(text) do
    text
    |> String.split(~r/[.!?]/)
    |> Enum.filter(fn word -> String.trim(word) != "" end)
    |> length()
  end

  #top words function
  def top_words(text) do
    text
    |> String.downcase() # goes from something like "Hello" to "hello"
    |> String.split() # splits into a word list
    |> Enum.map(fn word ->
      String.replace(word, ~r/[^a-z]/, "") # removes punctuation
      end)
    |> Enum.filter( fn word -> word != "" end) # remove empty strings
    |> Enum.frequencies() # %{"hello" => 2, "world => 1, ...}
    |> Enum.sort_by(fn {_word, count} -> count end, :desc) # sort by the count in descending order
    |> Enum.take(5) # take the top 5 words
  end
end

#this is how I can see the output when I run mix.bat for how many words there are in my sample sentence
SentenceAnalyzerProject.main()
