require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:link) }
    # it { is_expected.to validate_presence_of(:images) }
    # it { is_expected.to validate_presence_of(:video)}
    it { is_expected.to validate_length_of(:summary).is_at_most(500) }
    it { is_expected.to validate_length_of(:content).is_at_most(5000) }
  end

  describe "associations" do
    describe "association with user" do
      let(:user) { create :user }

      it "belongs to a user" do
        post = user.posts.build

        expect(post.user).to eq(user)
      end
    end

    describe "association with tag" do
      let(:post) { create :post }
      let!(:tag1) { create :tag, posts: [post] }
      let!(:tag2) { create :tag, posts: [post] }

      it "has many tags" do
        expect(post.tags).to include(tag1)
        expect(post.tags).to include(tag2)
      end
    end

    describe "association with trust" do
      let(:post) { create :post }

      it "has many trusts" do
        trust1 = post.trusts.new
        trust2 = post.trusts.new

        expect(post.trusts).to include(trust1)
        expect(post.trusts).to include(trust2)
      end
    end

    describe "association with report" do
      let(:post) { create :post }

      it "has many reports" do
        report1 = post.reports.new
        report2 = post.reports.new

        expect(post.reports).to include(report1)
        expect(post.reports).to include(report2)
      end
    end
  end

  describe "destroy post" do
    let(:user1) {create :user}
    let(:post1) { create :post, user: user1 }
    let!(:report1) { create :report, post: post1, user: user1 }
    let(:source1) { create :source, authenticity: 2 }
    let!(:trust1) { create :trust, post: post1, user: user1, source: source1 }

    it "does destroy trust and report, but not source" do
      expect { post1.destroy }.to change(Report, :count).by(-1)
                              .and change(Trust, :count).by(-1)
                              .and change(Source, :count).by(0)
    end
  end


  describe "methods" do
    describe "summarize" do
      let(:user) { create :user }
      let(:post1) { create :post, user: user }

      it "add a summary based on the content" do
        post1.summary = post1.summarize
        expect(post1.summary).not_to be(nil)
      end
    end
  end
end
