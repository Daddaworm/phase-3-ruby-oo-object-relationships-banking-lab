require 'pry'

class BankAccount
    attr_accessor :balance, :status
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @@all << self
    end

    def self.all
        @@all
    end


    def deposit(amount)
        # can deposit money into its account 
        @balance += amount
    end


    def display_balance
        # can display its balance
        "Your balance is $#{@balance}."
    end


    def valid?
        # is valid with an open status and a balance greater than 0
            @balance > 0 && @status == "open"
    end


    def close_account
        # can close its account
        @status = "closed"
    end



end
