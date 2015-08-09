require 'pry'
class Transfer
  attr_accessor :status, :amount, :sender, :receiver
  def initialize(sender,receiver,amount)
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status="pending"
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    unless @status=="complete"
      if @amount>@sender.balance
        @status= "rejected"
        return "Transaction rejected. Please check your account balance."
      else
        @sender.balance-=@amount
        @receiver.balance+=@amount
        @status="complete"
        # binding.pry
      end
    end
      def reverse_transfer
        if @status=="complete"
          @receiver.balance-=amount
          @sender.balance+=amount
          @status="reversed"
        end
      end
  end

end
