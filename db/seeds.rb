# Seed books
book1 = Book.create(title: "The Pragmatic Programmer", author: "Andrew Hunt and David Thomas", isbn: "978-0201616224")
book2 = Book.create(title: "Clean Code", author: "Robert C. Martin", isbn: "978-0132350884")
book3 = Book.create(title: "Design Patterns: Elements of Reusable Object-Oriented Software", author: "Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides", isbn: "978-0201633610")

# Seed reviews for book1
Review.create(content: "A must-read for every programmer!", rating: 5, book: book1)
Review.create(content: "Great insights, but some sections felt outdated.", rating: 4, book: book1)
Review.create(content: "Good, but not as practical as I expected.", rating: 3, book: book1)

# Seed reviews for book2
Review.create(content: "A fantastic book for software developers!", rating: 5, book: book2)
Review.create(content: "Great principles, but some parts were repetitive.", rating: 4, book: book2)

# Seed reviews for book3
Review.create(content: "Excellent guide for understanding design patterns.", rating: 5, book: book3)
Review.create(content: "This book is a bit dry but filled with valuable content.", rating: 3, book: book3)
Review.create(content: "A great read for software architects, but dense for beginners.", rating: 4, book: book3)
