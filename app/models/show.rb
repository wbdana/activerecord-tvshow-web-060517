class Show < ActiveRecord::Base

  def self.highest_rating
    best = Show.order(rating: :desc).limit(1)
    best[0][:rating]
  end

  def self.most_popular_show
    best = Show.order(rating: :desc).limit(1)
    best[0]
  end

  def self.lowest_rating
    worst = Show.order(rating: :asc).limit(1)
    worst[0][:rating]
  end

  def self.least_popular_show
    worst = Show.order(rating: :asc).limit(1)
    worst[0]
  end

  def self.ratings_sum
    Show.sum(:rating)
  end

  def self.popular_shows
    pop = []
    Show.all.each_with_object(pop){|show, pop| show.rating > 5 ? pop << show : show}
  end

  def self.shows_by_alphabetical_order
    Show.all.order(name: :asc)
  end

end
