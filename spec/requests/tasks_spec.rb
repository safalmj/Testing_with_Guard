require 'spec_helper'

describe "Tasks" do
  describe "GET /tasks" do
    it "displays task" do 
      Task.create!(:name => "Buy Car")
      visit tasks_path
      page.should have_content("Buy Car")
    end   
  end 
  
  # Testing creation of Tasks
  describe "POST /tasks" do
    it "create task" do 
      visit tasks_path 
      click_link "Add new Task"
      visit new_task_path
      fill_in "Name", :with => "Paint Fences" 
      click_button "Add"
      visit tasks_path
      page.should have_content("Paint Fences")
    end     
    
    it "checks if tasks field is not empty" do
        visit tasks_path 
        click_link "Add new Task"
        visit new_task_path
        fill_in "Name", :with => "" 
        click_button "Add" 
        page.should have_content("Name can't be blank")
    end
  end 
end
