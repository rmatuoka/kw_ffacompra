class User < ActiveRecord::Base
  validates_presence_of :nome, :message => "Nome deve ser preenchido!", :on => :save
  validates_presence_of :cpf, :message => " CPF deve ser preenchido!", :on => :save
  validates_uniqueness_of :cpf, :message => "CPF já está cadastrado no sistema!"
  validates_presence_of :rg, :message => "RG deve ser preenchido!", :on => :save
  validates_presence_of :cidade, :message => "Cidade deve ser preenchido!", :on => :save
  validates_presence_of :estado, :message => "Estado deve ser preenchido!", :on => :save
  
  acts_as_authentic do |c|
    c.login_field = 'email'
  end
  acts_as_authorization_subject
  
  scoped_search :on => [:email, :nome, :cpf, :rg]
  
  has_many :carts
  has_many :orders
  
  attr_writer :role
    after_save :define_role
    
    def role
      @role
      if self.has_role? :admin
        @role = :admin
      elsif self.has_role? :supervisor
        @role = :supervisor
      elsif self.has_role? :user
        @role = :user
      end
    end
    
    def define_role
      if @role
        self.has_no_roles!
        self.has_role! @role
      end
    end

  	def deliver_password_reset_instructions!
  		reset_perishable_token!
  	end  
  
end
