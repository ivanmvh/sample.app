require 'spec_helper'

describe "Static pages" do
  
  subject {page}

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page" do
    
    before {visit root_path}
    let (:heading) {'Sample App'}
    let (:page_title) {''}

    it_should_behave_like 'all static pages'    
    it {should_not have_selector('title', text: full_title('Home'))}
  end

  describe "Help page" do
    before {visit help_path} 

    let (:heading) {'Help'}
    let (:page_title) {'Help'}

    it_should_behave_like 'all static pages'
  end   

  describe "pagina 'Acerca de'" do
    before {visit about_path} 

    let (:heading) {'Acerca de'}
    let (:page_title) {'Acerca de'}

    it_should_behave_like 'all static pages'
  end

  describe "pagina 'Contacto'" do
    before {visit contacto_path}

    let (:heading) {'Contacto'}
    let (:page_title) {'Contacto'}

    it_should_behave_like 'all static pages'
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link 'About'
    page.should have_selector 'title', text: full_title('Acerca de')
    click_link 'Help'
    page.should have_selector 'title', text: full_title('Help')
    click_link 'Contacto'
    page.should have_selector 'title', text: full_title('Contacto')
    click_link 'Home'
    page.should have_selector 'title', text: full_title('')
    click_link 'Sign up now!'
    page.should have_selector 'title', text: full_title('Sign up')
    click_link 'sample app'
    page.should have_selector 'title', text: full_title('')
  end
end