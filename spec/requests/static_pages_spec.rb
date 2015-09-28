require 'spec_helper'

describe "Static pages" do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  
  subject {page}

  describe "Home page" do
    
    before {visit root_path}

    it { should have_selector('h1', text: 'Sample App')}

    it {should have_selector('title', text: full_title('') )}
    
    it {should_not have_selector('title', text: full_title('Home'))}
  end

  describe "Help page" do
    before {visit help_path} 
    it {should have_selector('h1', text: 'Help')}
    
    it {should have_selector('title',text: "#{base_title} | Help")}
  end

  describe "pagina 'Acerca de'" do
    before {visit about_path} 

    it {should have_selector('h1', text: 'Acerca de')}
  
    it {should have_selector('title',text: full_title('Acerca de') )}
  end

  describe "pagina 'Contacto'" do
    before {visit contacto_path}

    it {should have_selector('h1', text: 'Contacto')}
  
    it {should have_selector('title',text: full_title('Contacto')) }
  end
end