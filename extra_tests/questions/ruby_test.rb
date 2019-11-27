# Diff Module class
The first answer is good and gives some structural answers, but another approach is to think about what you're doing. Modules are about providing methods that you can use across multiple classes - think about them as "libraries" (as you would see in a Rails app). Classes are about objects; modules are about functions.
For example, authentication and authorization systems are good examples of modules. Authentication systems work across multiple app-level classes (users are authenticated, sessions manage authentication, lots of other classes will act differently based on the auth state), so authentication systems act as shared APIs.

╔═══════════════╦═══════════════════════════╦═════════════════════════════════╗
║               ║ class                     ║ module                          ║
╠═══════════════╬═══════════════════════════╬═════════════════════════════════╣
║ instantiation ║ can be instantiated       ║ can *not* be instantiated       ║
╟───────────────╫───────────────────────────╫─────────────────────────────────╢
║ usage         ║ object creation           ║ mixin facility. provide         ║
║               ║                           ║   a namespace.                  ║
╟───────────────╫───────────────────────────╫─────────────────────────────────╢
║ superclass    ║ module                    ║ object                          ║
╟───────────────╫───────────────────────────╫─────────────────────────────────╢
║ methods       ║ class methods and         ║ module methods and              ║
║               ║   instance methods        ║   instance methods              ║
╟───────────────╫───────────────────────────╫─────────────────────────────────╢
║ inheritance   ║ inherits behaviour and can║ No inheritance                  ║
║               ║   be base for inheritance ║                                 ║
╟───────────────╫───────────────────────────╫─────────────────────────────────╢
║ inclusion     ║ cannot be included        ║ can be included in classes and  ║
║               ║                           ║   modules by using the include  ║
║               ║                           ║   command (includes all         ║
║               ║                           ║   instance methods as instance  ║
║               ║                           ║   methods in a class/module)    ║
╟───────────────╫───────────────────────────╫─────────────────────────────────╢
║ extension     ║ can not extend with       ║ module can extend instance by   ║
║               ║   extend command          ║   using extend command (extends ║
║               ║   (only with inheritance) ║   given instance with singleton ║
║               ║                           ║   methods from module)          ║
╚═══════════════╩═══════════════════════════╩═════════════════════════════════╝

# Memoization
class User < ActiveRecord::Base
  @main_address ||= begin
    m_address = home_address if has_home_address?
    m_address = work_address unless has_not_work_address?
  end
end

# Rebase
git log
git rebase -i HEAD~10

# Cycle
# %w[one two three] to %w[one two three one two]
ring = %w[one two three].cycle
p ring.take(5)

# Create a class House avec des attributs automitaquement instancies

class House
  attr_accessor :rooms, :garage, :for_sale

  def initialize(rooms: 2,
                garage: true,
                for_sale: false)
    @rooms = rooms
    @garage = garage
    @for_sale = for_sale
  end
end
House.new..

# Trie le tableau et multiplie chaque valeur par 3. En une ligne
tab.sort.map(&3.method(:*))

# Prend un array et compte le nombre d'occurence de 9
tab.count{|n| n == 9}

# Prend un array fait la moyenne arrondie a l'entier
(tab.reduce(:+) / tab.size.to_f).round

# Retourne le premier entier positif quand un lambda est vrai; sans argument mettre 1.
def method(*lambda_args)
  (1..Float::INFINITY).each do |i|
    return 1 if lambda_args.all? {|l| l.(i)}

  end
end

# Un adolescent adore le cinema mais sa mere refuse de payer un abonnement.
# Mais elle paye une partie des billets
# Faire une fonction pour que l'abonnement soit plus rentable.
def method(subscription_price, ticket_price, participation)
  subscription_price / (ticket_price * participation / 100.0)
end
