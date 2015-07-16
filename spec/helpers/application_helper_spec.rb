require "rails_helper"

RSpec.describe ApplicationHelper, :type => :helper  do
  let!(:user)  { create(:user) }
  let!(:src) { Faker::Internet.url }

  describe "#embedded_video" do
    context 'with user' do
      it 'should return an iframe' do
        expect(embedded_video(src, user: user)).to have_selector('iframe')
      end
      it 'should have wemail query param' do
        video = embedded_video(src, user: user)
        iframe = Nokogiri::HTML(video)
        src = iframe.xpath("//iframe")[0]['src']
        uri = URI(src)
        params = CGI.parse(uri.query || "")
        expect(params["wemail"].present?).to be true
        expect(params["wemail"]).to eq([user.email])
      end

      it 'should not include user in the attributes of the iframe tag' do
        video = embedded_video(src, user: user)
        iframe = Nokogiri::HTML(video)
        user_attr = iframe.xpath("//iframe")[0]['user']
        expect(user_attr).to be nil
      end

    end
    context 'without user' do
      it 'should return an iframe' do
        expect(embedded_video(src)).to have_selector('iframe')
      end

      it 'should not have wemail' do
        video = embedded_video(src)
        iframe = Nokogiri::HTML(video)
        src = iframe.xpath("//iframe")[0]['src']
        uri = URI(src)
        params = CGI.parse(uri.query || "")
        expect(params["wemail"].present?).to be false
      end
    end
  end
end