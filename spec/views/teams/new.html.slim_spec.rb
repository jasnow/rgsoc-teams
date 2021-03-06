require 'spec_helper'

describe 'teams/new' do
  before(:each) do
    assign(:team, stub_model(Team, name: 'Team A+', description: 'The best',).as_new_record)
    allow(view).to receive(:can?).and_return(true)
    allow(view).to receive(:current_season).and_return build_stubbed(:season)
  end

  it 'renders new team form' do
    allow(view).to receive(:accessible_roles).and_return(Role::TEAM_ROLES) # what.
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'form[action=?][method=?]', teams_path, 'post' do
      assert_select 'input#team_name[name=?]', 'team[name]'
    end
  end
end
