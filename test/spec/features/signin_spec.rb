require 'spec_helper.rb'

feature 'Signing in' do
  scenario 'can sign in' do
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', :with => 'test@test.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end
end
