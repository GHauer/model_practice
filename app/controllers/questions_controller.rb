class QuestionsController < ApplicationController
  def question_1
    # What is the most recent movie on the list that the second actor appeared in?

    # Your Ruby goes here.
    the_actor = Actor.second

    the_actors_movies = []

    the_actor.roles.each do |the_role|
      the_actors_movies.push(the_role.movie)
    end

    most_recent_movie = { :year => 0, :title => "" }

    the_actors_movies.each do |the_movie|
      if the_movie.year.to_i > most_recent_movie[:year]
        most_recent_movie = { :year => the_movie.year.to_i, :title => the_movie.title }

      end
    end

    @most_recent_movie_for_second_actor = most_recent_movie[:title]
  end


  def question_2
    # Who directed the longest movie on the list?

    @director_of_longest_movie = Movie.order("duration DESC").first.director.name


   end


  def question_3
    # Which director has the most movies on the list?

  movie_counts = []

  the_top_director = Director.new

  Director.all.each do |director|
    if the_top_director.movies.count < director.movies.count
      the_top_director = director
    end
  end

  @director_with_the_most_movies = the_top_director.name



    # Director.all.each do |the_director|
    #   number_of_movies_directed_by_the_director = the_director.movies.count

    #   movie_counts.push(number_of_movies_directed_by_the_director)
    # end

    # @most_number_of_movies_by_a_single_director = movie_counts.max

    # @director_with_the_most_movies = @most_number_of_movies_by_a_single_director

  # movie_counts = []

  # Director.all.each do |the_director|
  #   number_of_movies_directed_by_the_director = the_director.movies.count

  #   movie_counts.push(number_of_movies_directed_by_the_director)

  #   @most_number_of_movies_by_a_single_director = movie_counts.max.


    # @director_with_the_most_movies = ???
  end




  def question_4
    # Which actor has been in the most movies on the list?
    # (If there's a tie, any one of them is fine)

    # Your Ruby goes here.

  movie_counts = []

  the_top_actor = Actor.new

  Actor.all.each do |actor|
    if the_top_actor.movies.count < actor.movies.count
      the_top_actor = actor
    end
  end

  @actor_with_the_most_movies = the_top_actor.name


  end

  def question_5
    # This one is hard. Work on it after all your other review is complete.

    # Which actor/director pair has the most movies on the list?
    # (If there's a tie, any pair of them is fine)

    most_movies_together = 0
 @actor = nil
 @director = nil

 Actor.all.each do |actor|
   this_actors_most_movies_with_one_director = 0
   this_actors_favorite_director = nil

   actor.movies.each do |movie|
     number_of_movies_with_same_director_as_this_one = actor.movies.where(:director_id => movie.director_id).count

     if this_actors_most_movies_with_one_director < number_of_movies_with_same_director_as_this_one
       this_actors_most_movies_with_one_director = number_of_movies_with_same_director_as_this_one
       this_actors_favorite_director = movie.director
     end
   end

   if most_movies_together < this_actors_most_movies_with_one_director
     most_movies_together = this_actors_most_movies_with_one_director
     @director = this_actors_favorite_director
     @actor = actor


    # @actor = ???
    # @director = ???
    # @movies_together = ???
  end
end
