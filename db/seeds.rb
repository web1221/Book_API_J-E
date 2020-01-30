class Seed
    def self.start(count = {authors: 5, books: 15})
        return 'Must create at least one author' if count[:authors] < 1
        puts '=== Started Seeding ==='
        seed_authors(count[:authors])
        seed_books(count[:books])
        puts '=== Finished Seeding ==='
    end

    private
    def self.seed_authors(author_count)
        Author.destroy_all

        author_count.times do |i|
            Author.create!(
                name: Faker::Book.author,
                age: rand((20..100))
            )
        end

        puts "  Created #{Author.count} Authors."
    end

    def self.seed_books(book_count)
        book_count.times do |i|
            Author.random.books.create!(
                title: Faker::Book.title,
                genre: Faker::Book.genre,
                publisher: Faker::Book.publisher
            )
        end

        puts "  Created #{Book.count} Books."
    end
end

Seed.start
