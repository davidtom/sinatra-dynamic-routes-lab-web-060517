require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get "/reversename/:name" do
    @name = params[:name]
    "#{@name.reverse}"
  end

  get "/square/:number" do
    @number = params[:number].to_i
    "#{@number ** 2}"
  end

  get "/say/:number/:phrase" do
    @number = params[:number].to_i
    a = (1..@number).to_a
    phrases = a.map {params[:phrase]}
    "#{phrases.join(" ")}"
  end

  get "/say/:word1/:word2/:word3/:word4/:word5" do
    @w1 = params[:word1]
    @w2 = params[:word2]
    @w3 = params[:word3]
    @w4 = params[:word4]
    @w5 = params[:word5]
    @arr = [@w1, @w2, @w3, @w4, @w5]
    "#{@arr.join(" ")+"."}"
  end

  get "/:operation/:number1/:number2" do
    operators = {
      "add" => :+,
      "subtract" => :-,
      "multiply" => :*,
      "divide" => :/
    }
    @op = operators[params[:operation]]
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i
    @arr = [@num1, @num2]
    "#{@arr.inject(@op)}"
  end

end
