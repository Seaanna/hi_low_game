class GameController < ActionController::Base

  def try
    # store a secret number in a cookie
    # if the cookies are not defined
    if session[:secret].nil?
      # cookies will equal 17
      session[:secret] = Random.rand(1..11)
    end
    # creates the counter to 0 if a number does not exist
    if cookies[:counter].nil?
      # set counter to 0
      cookies[:counter] = 0
    end
    # turn guess into an iteger
    @guess = params[:guess].to_i
    # turn the secret number into integer
    @secret = session[:secret].to_i
    # counter will increase until you win
    cookies[:counter] = cookies[:counter].to_i + 1
    # set an instance variable to the result (call it @result) of the guess (high/low/win)
    # guess is less than the secret number
    if @guess < @secret
      @result = "too low"
    # set an instance variable to the result (call it @result) of the guess (high/low/win)
    # guess is greater than the secret number
    elsif @guess > @secret
      @result = 'too high'
    # set an instance variable to the result (call it @result) of the guess (high/low/win)
    # win
    else
      @result = 'You win'
      # new random number will be chosen after you win
      session[:secret] = Random.rand(1..11)
      # counter resets when you win
      cookies[:counter] = 0
    end
    # the view needs to be rendered
    render 'try.html.erb'

  end # end of def try
  # Create a route (/new_game) and controller method (reset) to reset the game.
  def reset
    # resets the counter to -1 because on enter the counter will increase
    cookies[:counter] = -1
    #encrypted number will reset to another random number
    session[:secret] = Random.rand(1..11)
    # redirect to the home page
    redirect_to "http://localhost:3000/game"
  end

end
# end of class
