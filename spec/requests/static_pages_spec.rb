require 'spec_helper'
  
describe "Static pages" do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  describe "Home page" do
    it "should have the h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end
    
    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title',
        :text => "#{base_title} | Home")
    end
  end

  describe "Help page" do
    it "should have the h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end
    
    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title',
        :text => "#{base_title} | Help")
    end
  end

  describe "pagina 'Acerca de'" do
    it "should have the h1 'Acerca de'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'Acerca de')
    end
  
    it "should have the title 'Acerca de'" do
      visit '/static_pages/about'
      page.should have_selector('title',
        :text => "#{base_title} | Acerca de")
    end
  end

  describe "pagina 'Contacto'" do
    it "should have the h1 'Contacto'" do
      visit '/static_pages/contacto'
      page.should have_selector('h1', :text => 'Contacto')
    end
  
    it "should have the title 'Contacto'" do
      visit '/static_pages/contacto'
      page.should have_selector('title',
        :text => "#{base_title} | Contacto")
    end
  end
end