require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:link) }
    it { is_expected.to validate_presence_of(:images) }
    # it { is_expected.to validate_presence_of(:video)}
    it { is_expected.to validate_length_of(:content).is_at_most(500) }
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

  describe "methods" do
    let(:user1) { create :user }
    let(:user2) { create :user }
    let(:post1) { create :post, user: user1 }
    let!(:post2) { create :post, user: user2 }

    let!(:report1) { create :report, post: post1, user: user2 }
    let!(:report2) { create :report, post: post1, user: user2 }
    let!(:report3) { create :report, post: post1, user: user2 }

    let(:source1) { create :source, authenticity: 2 }
    let(:source2) { create :source, authenticity: 5 }
    let!(:trust1) { create :trust, post: post1, user: user2, source: source1 }
    let!(:trust2) { create :trust, post: post1, user: user2, source: source1 }
    let!(:trust3) { create :trust, post: post1, user: user2, source: source2 }

    describe "calculate_reports_score" do
      it "returns the total score based on the number of reports" do
        expect(post1.calculate_reports_score).to eq(-0.6)
      end

      it "returns 0 if there are no reports" do
        expect(post2.calculate_reports_score).to eq(0)
      end
    end

    describe "calculate_trusts_score" do
      it "returns the total score based on all trusts" do
        expect(post1.calculate_trusts_score).to eq(0.36)
      end

      it "returns 0 if there are no trusts" do
        expect(post2.calculate_trusts_score).to eq(0)
      end
    end

  end

end
