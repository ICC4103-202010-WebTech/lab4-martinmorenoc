class Ticket < ApplicationRecord
  belongs_to :order
  belongs_to :ticket_type
  before_validation :check_availability
  after_create :update_stats_create
  after_destroy :update_stats_destroy

  private
    def check_availability
      es = self.ticket_type.event
      raise "full event" if es.event_stat.attendance == es.event_venue.capacity
    end
    def update_stats_create
      puts "Ticket created"
      es = self.ticket_type.event.event_stat
      es.attendance += 1
      es.total_sales += self.ticket_type.ticket_price
      es.save!
    end

    def update_stats_update
      puts "Ticket destroyed"
      es = self.ticket_type.event.event_stat
      es.attendance -= 1
      es.total_sales -= self.ticket_type.ticket_price
      es.save!
    end
end
