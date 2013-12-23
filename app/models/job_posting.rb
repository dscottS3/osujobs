class JobPosting < ActiveRecord::Base
  belongs_to :department, touch: true
end
