# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean


#Author.destroy_all
authors = Author.create!([
  {name: 'Eyal Kushilevitz'},
  {name: 'Noam Nisan'},
  {name: 'Reinhard Diestel'},
  {name: 'David P. Williamson'},
  {name: 'David B. Shmoys'},
  {name: 'Noga Alon'},
  {name: 'Joel H. Spencer'}])

puts "Created #{Author.count} authors."


#Publisher.destroy_all
publishers = Publisher.create!([
  {name: 'Cambridge University Press'},
  {name: 'Springer'},
  {name: 'Wiley'},
  {name: 'Oxford University Press'}])

puts "Created #{Publisher.count} publishers."


#Category.destroy_all
categories = Category.create!([
  {name: 'Mathematics'},
  {name: 'Physics'},
  {name: 'Computer Science'}])

puts "Created #{Category.count} categories."


#Topic.destroy_all
topics = Topic.create!([
  {name: 'Boolean algebra', category_id: 1},
  {name: 'Logic circuits', category_id: 1},
  {name: 'Computational complexity', category_id: 3},
  {name: 'Graph theory', category_id: 1},
  {name: 'Probability', category_id: 1},
  {name: 'Approximation theory', category_id: 1},
  {name: 'Mathematical optimization', category_id: 1},
  {name: 'Algorithms', category_id: 3},
  {name: 'Quantum information', category_id: 2}])

puts "Created #{Topic.count} topics."


#Language.destroy_all
languages = Language.create!([
  {name: 'English'},
  {name: 'Japanese'}])

puts "Created #{Language.count} languages."


#Location.destroy_all
locations = Location.create!([
  {room: '311', bookshelf: '1', shelf: '1'},
  {room: '311', bookshelf: '1', shelf: '2'},
  {room: '311', bookshelf: '1', shelf: '3'},
  {room: '311', bookshelf: '2', shelf: '1'},
  {room: '311', bookshelf: '2', shelf: '2'},
  {room: '311', bookshelf: '2', shelf: '3'}])

puts "Created #{Location.count} locations."


#Owner.destroy_all
owners = Owner.create!([
  {name: 'A Lab', label: 'A'},
  {name: 'X research project', label: 'X'}])

puts "Created #{Owner.count} owners."


#Book.destroy_all
books = Book.create!([
  {
    title: 'Communication Complexity',
    blurb: 'Communication Complexity surveys this mathematical theory, concentrating on the question of how much communication is necessary for any particular process. The first part of the book is devoted to the simple two-party model introduced by Yao in 1979, which is still the most widely studied model. The second part treats newer models developed to deal with more complicated communication processes. Finally, the authors treat applications of these models, including computer networks, VLSI circuits, and data structures.',
    language_id: 1,
    publisher_id: 1,
    :topics => Topic.where(:name => ['Boolean algebra', 'Logic circuits', 'Computational complexity']),
    :authors => Author.where(:name => ['Eyal Kushilevitz', 'Noam Nisan'])
  },
  {
    title: 'Graph Theory',
    blurb: 'This introduction to graph theory offers a reassessment of the theory\'s main fields, methods and results. Viewed as a branch of pure mathematics, the theory of finite graphs is developed as a coherent subject in its own right, with its own unifying questions and methods. The work seeks to complement, not replace, the existing more algorithmic treatments of the subject. There are examples, illustrations, historical remarks and exercises at the end of each chapter. The text may be used at various levels. It contains all the standard basic material for a first undergraduate course, while it offers more proofs of several more advanced results for a graduate course. These proofs are described in as much detail as their simpler counterparts, with an informal discussion of their underlying ideas complementing their rigorous step-by-step account. Finally, for the professional mathematician the book affords an overview of graph theory, with its typical questions and methods, its classic results.',
    language_id: 1,
    publisher_id: 2,
    :topics => Topic.where(:name => ['Graph theory']),
    :authors => Author.where(:name => ['Reinhard Diestel']),
    created_at: 2.months.ago
  },
  {
    title: 'The Design of Approximation Algorithms',
    blurb: 'Discrete optimization problems are everywhere, from traditional operations research planning problems, such as scheduling, facility location, and network design; to computer science problems in databases; to advertising issues in viral marketing. Yet most such problems are NP-hard. Thus unless P = NP, there are no efficient algorithms to find optimal solutions to such problems. This book shows how to design approximation algorithms: efficient algorithms that find provably near-optimal solutions. The book is organized around central algorithmic techniques for designing approximation algorithms, including greedy and local search algorithms, dynamic programming, linear and semidefinite programming, and randomization. Each chapter in the first part of the book is devoted to a single algorithmic technique, which is then applied to several different problems. The second part revisits the techniques but offers more sophisticated treatments of them. The book also covers methods for proving that optimization problems are hard to approximate. Designed as a textbook for graduate-level algorithms courses, the book will also serve as a reference for researchers interested in the heuristic solution of discrete optimization problems.',
    language_id: 1,
    publisher_id: 1,
    :topics => Topic.where(:name => ['Approximation theory', 'Mathematical optimization', 'Algorithms']),
    :authors => Author.where(:name => ['David P. Williamson', 'David B. Shmoys'])
  },
  {
    title: 'The Probabilistic Method',
    blurb: 'Written by two leading authorities in the field The Probabilistic Method is an ideal reference for researchers in combinatorics and algorithm design who would like to better understand the use of probabilistic methods. The book\'s numerous exercises and examples also make it an excellent textbook for graduate-level courses in mathematics and computer science.',
    language_id: 1,
    publisher_id: 3,
    :topics => Topic.where(:name => ['Probability', 'Graph theory']),
    :authors => Author.where(:name => ['Noga Alon', 'Joel H. Spencer']),
    created_at: 1.year.ago
  }])

puts "Created #{Book.count} books."


#Rindoku.destroy_all
rindokus = Rindoku.create!([
  {year: 2014, semester: 'Summer', book_id: 3},
  {year: 2013, semester: 'Winter', book_id: 2},
  {year: 2013, semester: 'Summer', book_id: 4},
  ])

puts "Created #{Rindoku.count} rindokus (circular readings)."


#Edition.destroy_all
editions = Edition.create!([
  {
    book_id: 1,
    isbn13: '978-0-521-02983-4',
    cover: 'Paperback',
    edition: 1,
    amazon_id: '052102983X'
  },
  {
    book_id: 2,
    isbn13: '978-3-642-14278-9',
    cover: 'Paperback',
    edition: 4,
    amazon_id: '3642142788'
  },
  {
    book_id: 2,
    isbn13: '978-3-540-26183-4',
    cover: 'Paperback',
    edition: 3,
    amazon_id: '3540261834'
  },
  {
    book_id: 3,
    isbn13: '978-0-521-19527-0',
    cover: 'Hardback',
    edition: 4,
    amazon_id: '0521195276',
  },
  {
    book_id: 4,
    isbn13: '978-0-470-17020-5',
    cover: 'Hardback',
    edition: 3,
    amazon_id: '0470170204'
  },
  ])

puts "Created #{Edition.count} editions."


#Copy.destroy_all
copies = Copy.create!([
  {edition_id: 1, location_id: 1, owner_id: 1},
  {edition_id: 1, location_id: 2, owner_id: 2},
  {edition_id: 1, location_id: 2, owner_id: 2},
  {edition_id: 2, location_id: 3, owner_id: 1},
  {edition_id: 2, location_id: 4, owner_id: 1},
  {edition_id: 3, location_id: 1, owner_id: 2},
  {edition_id: 3, location_id: 2, owner_id: 2},
  {edition_id: 3, location_id: 3, owner_id: 1},
  {edition_id: 4, location_id: 1, owner_id: 1},
  {edition_id: 5, location_id: 1, owner_id: 1, lost: true}])

puts "Created #{Copy.count} copies."


#User.destroy_all
users = User.create!([
  {
    name: 'John Doe',
    username: 'jdoe',
    email: 'jdoe@example.com',
    encrypted_password: 'myEncryptedPass',
    salt: 'mySalt',
    librarian: true,
    admin: true
  },
  {
    name: 'John Simth',
    username: 'jsmith',
    email: 'jsmith@example.com',
    encrypted_password: 'myEncryptedPass',
    salt: 'mySalt',
    librarian: true,
    admin: false
  },
  {
    name: 'Joanne Black',
    username: 'jblack',
    email: 'jblack@example.com',
    encrypted_password: 'myEncryptedPass',
    salt: 'mySalt',
    librarian: false,
    admin: false
  }])

puts "Created #{User.count} users."


#Review.destroy_all
reviews = Review.create!([
  {
    book_id: 1,
    user_id: 3,
    score: 5,
    comment: "The best book ever"
  },
  {
    book_id: 1,
    user_id: 2,
    score: 4,
    comment: "Great!"
  },
  {
    book_id: 2,
    user_id: 1,
    score: 5,
    comment: "A master piece"
  },
  {
    book_id: 2,
    user_id: 2,
    score: 3,
    comment: "Good!"
  },
  {
    book_id: 2,
    user_id: 3,
    score: 1,
    comment: "Too difficult!"
  }
  ])

puts "Created #{Review.count} reviews."
