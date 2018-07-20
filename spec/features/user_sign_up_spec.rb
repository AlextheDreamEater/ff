require 'spec_helper'
require 'rails_helper'

feature 'User signs up' do
  scenario 'with valid userid and password' do
    visit root_path
    click_link "Create Account"
    fill_in 'user_userid', :with => "e"
    fill_in 'user_email', :with => "e@e.com"
    fill_in 'user_password', :with => "e"
    fill_in 'user_password_confirmation', :with => "e"
    click_button 'Create Account'
    visit root_path
    expect(page).to have_link ('Sign-Out')
  end

  # feature 'User signs in' do
  # scenario 'with valid userid and password' do
  #   visit root_path
  #   click_link "Sign-In"
  #   fill_in 'user_id', with: "q"
  #   fill_in 'password', with: "q"
  #   click_button 'Sign In'
  #   visit root_path
  #   expect(page).to have_link ('Sign-In')
  # end 
end
