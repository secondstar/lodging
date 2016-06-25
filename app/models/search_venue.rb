class SearchVenue < Representation
  def venues
    self.venues
  end

  def election_day=(v)
    self.electionDay = v
  end

  def address
    [self.street,
     self.city,
     self.state,
     self.zipcode].join(' ')
  end
end