require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should belong_to(:post) }
  end

  describe 'callbacks' do
    describe 'after_save' do
      let(:user) { User.create(name: 'Naledi Dikgale') }
      let(:post) { Post.create(title: 'Test Post') }

      it 'increments the likes_counter of the associated post' do
        like = Like.create(author: user, post:)
        expect { like.save }.to change { post.reload.likes_counter }.by(1)
      end
    end
  end
end
