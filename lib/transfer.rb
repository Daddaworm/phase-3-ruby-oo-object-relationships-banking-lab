require 'pry'

class Transfer
    attr_accessor :sender, :receiver, :status, :amount


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end


  def valid?
    # can check that both accounts are valid
    # calls on the sender and receiver's #valid? methods
    sender.valid? && receiver.valid?
  end


  def execute_transaction
    # can execute a successful transaction between two accounts
    # each transfer can only happen once
    # rejects a transfer if the sender does not have enough funds (does not have a valid account)
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end


  def reverse_transfer
    # an reverse a transfer between two accounts
    # it can only reverse executed transfers
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end


  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end


end
