require 'data_mapper'
require 'dm-postgres-adapter'

class Booking
  include DataMapper::Resource

  property :id, Serial
  property :confirmed, Boolean, :default => false
  property :requester, String
  has 1, :space

  def confirm
    raise "Already confirmed" if @confirmed
    @confirmed = true;
  end

  def space_owner
    space.owner
  end

end
