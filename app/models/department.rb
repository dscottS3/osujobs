class Department < ActiveRecord::Base
  has_many :job_postings, dependent: :destroy
end
