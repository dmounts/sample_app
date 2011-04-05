require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home Page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "should have a Contact page at '/contacts/company'" do
    get '/contacts/company'
    response.should have_selector('title', :content => "Contact")
  end

  it "should have a About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end


  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end

  it "should have a Sign Up page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign Up")
  end

  it "should have the right links on the layout" do
    visit root_path
    response.should have_selector('title', :content => "Home")
    click_link "About"
    response.should have_selector('title', :content => "About")
    click_link "Contact"
    response.should have_selector('title', :content => "Contact");
    click_link "Home"
    response.should have_selector('title', :content => "Home");
    click_link "Sign up now!"
    response.should have_selector('title', :content => "Sign Up");
    response.should have_selector('a[href="/"]>img')
  end
end
