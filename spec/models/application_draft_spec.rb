require 'spec_helper'

RSpec.describe ApplicationDraft do
  it_behaves_like 'HasSeason'

  context 'with callbacks' do
    it 'sets the current season if left blank' do
      expect { subject.valid? }.to \
        change { subject.season }.from(nil).to(Season.current)
    end
  end

end
