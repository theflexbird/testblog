class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: String
  field :title, type: String
  field :archived, type: Boolean, default: false
  field :tags, type: String

  validates_presence_of :body, :title

  belongs_to :user

  def tags_array
    self.tags.to_s.split(',')
  end

end
