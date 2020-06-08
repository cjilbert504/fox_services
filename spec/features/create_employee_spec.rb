require 'rails_helper'

RSpec.describe "Creating a new employee", type: :feature do

    scenario 'valid inputs' do
        visit signup_path
        fill_in 'Name', with: 'Dustin'
        fill_in 'Email', with: 'dustin@example.com'
        fill_in 'Password', with: 'dustin'
        fill_in 'Password confirmation', with: 'dustin'
        click_on 'Create Employee'
        visit employees_path
        expect(page).to have_content('Dustin')
    end

    scenario 'Blank name field' do
        visit signup_path
        fill_in 'Name', with: ''
        fill_in 'Email', with: 'dustin@example.com'
        fill_in 'Password', with: 'dustin'
        fill_in 'Password confirmation', with: 'dustin'
        click_on 'Create Employee'
        expect(page).to have_content("Name can't be blank")
    end

    scenario 'Blank email field' do
        visit signup_path
        fill_in 'Name', with: 'Dustin'
        fill_in 'Email', with: ''
        fill_in 'Password', with: 'dustin'
        fill_in 'Password confirmation', with: 'dustin'
        click_on 'Create Employee'
        expect(page).to have_content("Email can't be blank")
    end

    scenario 'Blank password field' do
        visit signup_path
        fill_in 'Name', with: 'Dustin'
        fill_in 'Email', with: 'dustin@example.com'
        fill_in 'Password', with: ''
        fill_in 'Password confirmation', with: 'dustin'
        click_on 'Create Employee'
        expect(page).to have_content("Password can't be blank")
    end

    scenario 'Blank password confirmation field' do
        visit signup_path
        fill_in 'Name', with: 'Dustin'
        fill_in 'Email', with: 'dustin@example.com'
        fill_in 'Password', with: 'dustin'
        fill_in 'Password confirmation', with: ''
        click_on 'Create Employee'
        expect(page).to have_content("Password confirmation doesn't match Password")
    end

    

end