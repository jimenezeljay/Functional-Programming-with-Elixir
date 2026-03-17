defmodule SentenceAnalyzerProject do
  @moduledoc """
  Documentation for `SentenceAnalyzerProject`.
  """
  #entry point for the IO.puts to be
  def main do
   text = "Hello, world! This is a test sentence. How many words are here?"

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
  def count_words(text) do
    text
    |> String.split()
    |> length()
  end

  #regex pattern to split sentences based on punctuation marks
  def count_sentences(text) do
    text
    |> String.split(~r/[.!?]/)
    |> Enum.filter(fn word -> String.trim(word) != "" end)
    |> length()
  end

  def top_words(_text) do
    #TODO
  end
end

#this is how I can see the output when I run mix.bat for how many words there are in my sample sentence
SentenceAnalyzerProject.main()
