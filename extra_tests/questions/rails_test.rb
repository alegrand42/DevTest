# What is Rails Migration?
Rails Migration enables Ruby to make changes to the database schema,
making it possible to use a version control system to leave things synchronized with the actual code.

# Explain what is Cross-Site Request Forgery (CSRF) and how Rails is protected against it?
CSRF is a form of attack where hacker submits a page request on your behalf to a different website,
causing damage or revealing your sensitive data.
To protect from CSRF attacks, you have to add “protect_from_forgery” to your ApplicationController.
This will cause Rails to require a CSRF token to process the request.
CSRF token is given as a hidden field in every form created using Rails form builders.

# Mention what is the difference between calling super() and super call?
super(): A call to super() invokes the parent method without any arguments, as presumably expected.
super call: A call to super invokes the parent method with the same arguments that were passed to the child method.
An error will therefore occur if the arguments passed to the child method don’t match what the parent is expecting.

# Design Pattern
Design patterns can be powerful conceptual models for thinking about how to solve problems in software development.
Use of abstract classes.

# CRUD: Create, read, Update, Delete

# ORM
ORM is the acronym for Object Relational Mapping.
ex: active record
-> database independant
-> domain model patern
-> caching
->relationships

# Scope
A scope represents a narrowing of a database query, such as where(:color => :red).select('shirts.*').includes(:washing_instructions)
class Shirt < ActiveRecord::Base
  scope :red, -> { where(color: 'red') }
  scope :dry_clean_only, -> { joins(:washing_instructions).where('washing_instructions.dry_clean_only = ?', true) }
end

# ActiveRecord: Active Record is the M in MVC - the model - which is the layer of the system responsible for representing business data and logic. Active Record facilitates the creation and use of business objects whose data requires persistent storage to a database. It is an implementation of the Active Record pattern which itself is a description of an Object Relational Mapping system.

# REST HTTP Verbs 5
GET     retieve items from resource
POST    create new
PUT     replace existing
PATCH   update existing item
DELETE  delete

# Ruby
Ruby is a dynamic interpreted and reflective, object oriented langage

# Block, Proc, Lamda

# TCP and UDP
In UDP, the client does not form a connection with the server like in TCP and instead just sends a datagram. Similarly, the server need not accept a connection and just waits for datagrams to arrive. Datagrams upon arrival contain the address of sender which the server uses to send data to the correct client.

# app/views/layout/application.html.erb
la vue affiche les donnees a l'utilisateur
template html contenant des balises erb pour ruby

# config/routes.rb
Detient toutes les url existantes et les controllers lies.
Peut gerer les autorisations.

# db/schema.rb
Representation ruby de la db.

# Creation d'un model House avec un attribut name en string et addresse test
rails g model House name:string address:text

# Creation d'un controller House avec les actions shoiw et edit
rails g controller Houses show edit

# Creation d'une task Run
rails g task Run

# Deux classes Family, Children.
# Les enfants appartiennent a la famille.
# Si la famille est supprimee, les enfants sont aussi supprimes
# Si l'enfant est modifie, mets a jour updated_at de famille
class Family < ActiveRecord::Base
  has_many :children, dependant: :destroy
end

class Child < ActiveRecord::Base
  belongs_to: :famille, touch: true
end

# Class Person.
# L'email et le nom sont obligatoires.
# Le prenom est obligatoire quand il est rempli
# L'age est sup a 18
class Person < ActiveRecord::Base
  validates :email, uniqueness: true, presence :true
  validates :last_name, uniqueness: true, presence :true
  validates :age, numericality: {greater_than_or_equal_to: 18, allow_nil: true}

  def check_age
    errors.add(:id, "Age must be above 18") if age < 18
  end
end

# Une classe Corporate has_many employees
# Une classe Employee belongs_to corporate
# A chaque fois qu;une corporate est chargee, afficher les employees
Corporate.includes(:employees).linit(100)

# Optimizer: Record.all.sort{|a, b| b.id <=> a.id}.map{|r| [r.id, r.name]}[0..49]
Record.order(:id).pluck(:id, :name).limit(50)
