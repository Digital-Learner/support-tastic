require 'rails_helper'

RSpec.describe Ticket, :type => :model do


  let!(:department) { Department.create(name: "Marketing") }
  let!(:ticket)     { FactoryGirl.create(:ticket, department: department) }

  subject { ticket }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:subject) }
  it { should respond_to(:detail) }
  it { should respond_to(:department_id) }
  it { should respond_to(:reference_id) }
  it { should respond_to(:state_id) }

  it { should be_valid }

  describe "when name is not present" do
    before { subject.name = "" }

    # older RSpec (still valid) syntax
    # not to be confused with monkey patching 'should' on objects
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { subject.email = "" }

    it { is_expected.to_not be_valid }
  end

  describe "when subject is not present" do
    before { subject.subject = "" }

    it { is_expected.to_not be_valid }
  end

  describe "when detail is not present" do
    before { subject.detail = "" }

    it { is_expected.to_not be_valid }
  end

  describe "when department is not present" do
    before { subject.department_id = "" }

    it { is_expected.to_not be_valid }
  end

  describe "when name is too long" do

    before { subject.name = "a" * 46 }

    # new RSpec 3.0 syntax
    it { is_expected.to_not be_valid }
  end

  describe "when name is too short" do
    before { subject.name = "Bob" }

    it { is_expected.to_not be_valid }
  end


  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        subject.email = invalid_address

        expect(subject).to_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be invalid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.last@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        subject.email = valid_address

        expect(subject).to be_valid
      end
    end
  end

  # refactor this test - presumably when we introduce a User model
  # describe "when email address is already taken" do
  #   before do
  #     user_with_same_email = subject.dup
  #     user_with_same_email.email = subject.email.upcase

  #     puts "subject.email              -> #{subject.email}"
  #     puts "user_with_same_email.email -> #{user_with_same_email.email}"
  #     puts "valid? #{user_with_same_email.valid?}"
  #     user_with_same_email.save
  #     puts "#{Ticket.find_by(name: user_with_same_email.name).inspect}"
  #   end

  #   it { is_expected.to_not be_valid }
  # end

  describe "when email address with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMPle.COM" }

    it "should be saved as all lower-case" do
      subject.email = mixed_case_email
      subject.save
      expect(subject.reload.email).to  eql mixed_case_email.downcase
    end
  end

  it "should belong to department" do
    expect(subject._reflections[:department].macro).to eq :belongs_to
  end

  it "should belong to state" do
    expect(subject._reflections[:state].macro).to eq :belongs_to
  end

  describe "reference_id" do

    it "is 'nil' on instantiation" do
      ticket = FactoryGirl.build(:ticket)

      expect(ticket.reference_id).to be_nil
    end

    it "takes the format 'ABC-123-ABC-123-ABC'" do
      reference_id = subject.reference_id

      expect(reference_id.length).to eql 19

      ref_parts = reference_id.split('-')

      expect(ref_parts.length).to eql(5)
      expect([ref_parts[0], ref_parts[2], ref_parts[4]].map {|e| e.match (/[A-Z]{3}/) }.compact.length).to eq 3
      expect([ref_parts[1], ref_parts[3]].map {|e| e.match (/\d{3}/) }.compact.length).to eq 2
    end
  end

  describe "state_id" do
    it "is assigned default value 'Waiting for Staff Response' on save" do
      state = State.find_by(name: 'Waiting for Staff Response')

      expect(subject.state_id).to eql state.id
    end
  end
end
