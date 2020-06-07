require 'rails_helper'

RSpec.describe "Creating a new employee", type: :feature do

    scenario 'valid inputs' do
        visit new_employee_path
        fill_in 'Name', with: 'Dustin'
        fill_in 'Email', with: 'dustin@example.com'
        fill_in 'Password', with: 'dustin'
        fill_in 'Password confirmation', with: 'dustin'
        click_on 'Create Employee'
        visit employees_path
        expect(page).to have_content('Dustin')
    end

end