class Todo < ActiveRecord::Base
  validates_presence_of :title
  validates_numericality_of :status
  validates :ticket, numericality: true,
            presence: true, allow_blank: true # needed otherwise it'll try to validate a nil value
  validates :ticket_url, :format => URI::regexp(%w(http https)), allow_blank: true
  validates :pull_request, :format => URI::regexp(%w(http https)), allow_blank: true
    
  STATUS = {
  	0 => 'Unstarted',
    1 => 'Unestimated',
    2 => 'Started',
    3 => 'Finished',
    4 => 'Delivered',
    5 => 'Accepted',
    6 => 'Rejected'
  }

  def get_status
  	STATUS[self.status]
  end

end
