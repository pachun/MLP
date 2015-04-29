schema "0001 initial" do
  entity "PongRules" do
    string :label, optional: false
    boolean :balls_back, default: true, optional: false
    boolean :rerack_when_9_cups_remain, default: false, optional: false
    boolean :rerack_when_8_cups_remain, default: false, optional: false
    boolean :rerack_when_7_cups_remain, default: false, optional: false
    boolean :rerack_when_6_cups_remain, default: false, optional: false
    boolean :rerack_when_5_cups_remain, default: false, optional: false
    boolean :rerack_when_4_cups_remain, default: false, optional: false
    boolean :rerack_when_3_cups_remain, default: false, optional: false
    boolean :rerack_when_2_cups_remain, default: false, optional: false

    datetime :created_at, default: Time.now, optional: false
    datetime :updated_at, default: Time.now, optional: false
  end

  # Examples:
  #
  # entity "Person" do
  #   string :name, optional: false
  #
  #   has_many :posts
  # end
  #
  # entity "Post" do
  #   string :title, optional: false
  #   string :body
  #
  #   datetime :created_at
  #   datetime :updated_at
  #
  #   has_many :replies, inverse: "Post.parent"
  #   belongs_to :parent, inverse: "Post.replies"
  #
  #   belongs_to :person
  # end

end
