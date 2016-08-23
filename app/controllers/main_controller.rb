class MainController < ActionController::Base
# Creating a method called answers

  def name
    @new_name = params[:name].upcase

    #render 'new_name.html.erb'
  end

  def answers
    # User is making a guess in the params[:number]
    # in URL localhost:3000/answers?number = 13
    user_guess = params[:number].to_i
    if user_guess < 15
      render text: "The number " + params[:number].to_s + " is too low"
    elsif user_guess > 15
      render text: "The number " + params[:number].to_s + " is too high"
    else
      render text: "Just right!"
    end
  end
end
