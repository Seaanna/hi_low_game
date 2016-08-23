class PasswordController < ApplicationController
  #
  def check
    # name will be stored in an instance variable
    @userid = params[:name]
    # password will be stored in an instance variable
    @password = params[:code]
      # credential for userid
     if @userid.length >= 6 && !@userid.include?("#") && !@userid.include?("!") && !@userid.include?("$")
       @message2 = "Valid"
     else
       @message2 = "invalid"
     end
    # credentials for password
    if @password.length >= 6 && (@password.include?("#") || @password.include?("$") || @password.include?("!")) && (@password.include?("1") || @password.include?("2") || @password.include?("3") || @password.include?("4") || @password.include?("5") || @password.include?("6") || @password.include?("7") || @password.include?("8") || @password.include?("9") || @password.include?("0")) && (@password != @password.upcase && @password != @password.downcase)
      # instance variable is being called in a flash in the check.html.erb file
      @message = "Valid"
    else
      @message = "invalid"
    end

  end

end
# end of class
