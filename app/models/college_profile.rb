class CollegeProfile < ActiveRecord::Base
  attr_accessible :name, :degree, :year, :gpa
  
  belongs_to :user
  
  year_regex = /^((\d{2})|(\d{4}))$/
  
  validates :name,  :presence   => true,
                    :length     => { :within => 3..100}
  validates :degree,  :length   => { :maximum => 100 }
  validates :year,  :format     => { :with => year_regex},
                    :allow_blank => true
  validates :gpa,   :numericality => {:greater_than => 0},
                    :allow_blank  => true
                    
  validates_associated :user
end
