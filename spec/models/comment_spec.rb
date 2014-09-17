require 'rails_helper'

RSpec.describe Comment, :type => :model do

  let!(:valid_comment) { Comment.create(comment: "Four") }

  subject { valid_comment }

  it { should respond_to(:comment) }

  it { should be_valid }

  describe "when comment is empty" do
    before { subject.comment = "" }

    it { should_not be_valid }
  end

  describe "when too short ( < 4 characters)" do
    before { subject.comment = "A" }

    it { should_not be_valid }
  end
end
