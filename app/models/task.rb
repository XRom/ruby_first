class Task < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates :author, presence: true
  validates :description, length: { maximum: 500 }

  belongs_to :author, class_name: "User"
  belongs_to :assignee, class_name: "User", optional: true
  
  state_machine :initial => :new do
    event :development do
      transition [:new, :in_qa, :in_code_review] => :in_development
    end

    event :testing do
      transition :in_development => :in_qa
    end

    event :review do
      transition :in_qa => :in_code_review
    end

    event :prepare do
      transition :in_code_review => :ready_for_release
    end

    event :release do
      transition :ready_for_release => :released
    end

    event :archived do
      transition [:new, :released] => :archived
    end
  end
end
