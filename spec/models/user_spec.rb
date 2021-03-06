# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  before do
     @user = User.new(name: "Example User", email: "user@example.com",
              password: "foobar", password_confirmation: "foobar") 
  end
     
  subject { @user }
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it {should be_valid}

  describe "<si nombre (name) vacio es invalido>" do
    before {@user.name = " "}
    it {should_not be_valid}
  end 

  describe "<si email vacio es invalido>" do
    before {@user.email = " "}
    it {should_not be_valid}
  end    

  describe "<cuando el nombre (name) es muy largo es invalido>" do
    before {@user.name = "a" * 51}
    it {should_not be_valid}
  end  

  describe "<cuando el formato del email es invalido>" do
    it "debe ser invalido" do 
      wemails = %w[user@foo,com user_at_foo.org example.user@foo.
                  foo@bar_baz.com foo@bar+baz.com] 
      wemails.each do |email_invalido|
        @user.email=email_invalido
        @user.should_not be_valid
      end
    end
  end  

  describe "<cuando el formato del email es valido>" do
    it "debe ser valido" do
      wemails = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      wemails.each do |email_valido|
        @user.email = email_valido
        @user.should be_valid
      end
    end
  end 

  describe "email address with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMPle.CoM" }
    it "should be saved as all lower-case" do
      @user.email = mixed_case_email
      @user.save
      @user.reload.email.should == mixed_case_email.downcase
    end
  end

  describe "<Cuando el email ya esta siendo usado es invalido>" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

  describe "<si no entra el password es invalido>" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "<Cuando el password no es igual a la confirmacion es invalido>" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "<Cuando el password_confirmation es nil es invalido" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "<Cuando el password es muy corto es invalido>" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "< Valor return del metodo authenticate >" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }
    
    describe "<con password valido>" do
      it { should == found_user.authenticate(@user.password) }
    end
    
    describe "<con password lnvalido>" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end
end