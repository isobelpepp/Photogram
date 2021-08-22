require 'rails_helper'

FactoryBot.define do
  factory :post do
    caption { "Live laugh love!!!" }
    image { Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/attachment.jpeg', 'image/jpg') }
    user { create(:user) }
    id { 1 }
  end
end
