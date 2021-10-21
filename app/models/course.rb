class Course < ApplicationRecord
    
    belongs_to :user
    has_many :lessons, dependent: :destroy
    has_many :enrollments
    
    validates :title, :short_description, :language, :price, :level,  presence: true
    validates :description, presence: true, length: { :minimum => 5 }
    has_rich_text :description
    
    extend FriendlyId
    friendly_id :title, use: :slugged
    
    def to_s
        title
    end
    
    def update_rating
      if enrollments.any? && enrollments.where.not(rating: nil).any?
        update_column :average_rating, (enrollments.average(:rating).round(2).to_f)
      else
        update_column :average_rating, (0)
      end
    end
      
    def bought(user)
      self.enrollments.where(user_id: [user.id], course_id: [self.id]).empty?
    end
  
      LANGUAGES = [ :"English", :"Spanish", :"Portuguese", :"French", :"Italian", :"Russian"]
      def self.languages
        LANGUAGES.map { |language| [language, language] }
      end
    
    LEVELS = [:"Beginner", :"Intermediate", :"Advanced"]
      def self.levels
        LEVELS.map { |level| [level, level] }
      end
      
     include PublicActivity::Model
      tracked owner: Proc.new{ |controller, model| controller.current_user }

end
