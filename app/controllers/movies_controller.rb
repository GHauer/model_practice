class MoviesController < ApplicationController
  def index
    @list_of_movies = Movie.all
  end

  def show
    # Your code goes here
    # Use the information after the slash in the URL to look up the movie with the corresponding ID number
    # Store the movie in the @movie instance variable so the view can format it

end


  #   @movie = Movie.find_by({ :id => params[:id] })
  #    def sq
  #   @the_number = params[:number].to_f
  #   @answer = (@the_number)*(@the_number)
  #   @answeri = @answer.to_i
  #   @the_numberi = @the_number.to_i
  # end

  # def sqrt
  #   @the_number = params[:number].to_f
  #   @answer = Math.sqrt(@the_number)
  #   @answeri = @answer.to_i
  #   @the_numberi = @the_number.to_i
  # end

  # def pmt
  #   @rate = (params[:interest_rate].to_f)/100
  #   @nper = params[:number_of_payments].to_f
  #   @pval = params[:present_value].to_f
  #   @payment = @pval * (@rate * ((1 + @rate) ** @nper) / ((1 + @rate) ** @nper - 1))
  #   @answer = @payment.to_i
  end
end
