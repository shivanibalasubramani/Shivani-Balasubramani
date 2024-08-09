package com.library.service;

import com.library.repository.BookRepository;
import java.util.List;

public class BookService {

    private BookRepository bookRepository;

    // Setter for dependency injection
    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    // Method to display books
    public void displayBooks() {
        List<String> books = bookRepository.getBooks();
        for (String book : books) {
            System.out.println(book);
        }
    }
}
