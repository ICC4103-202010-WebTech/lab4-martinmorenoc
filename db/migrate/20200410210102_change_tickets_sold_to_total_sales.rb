class ChangeTicketsSoldToTotalSales < ActiveRecord::Migration[6.0]
  def change
    rename_column :event_stats, :tickets_sold, :total_sales
  end
end
