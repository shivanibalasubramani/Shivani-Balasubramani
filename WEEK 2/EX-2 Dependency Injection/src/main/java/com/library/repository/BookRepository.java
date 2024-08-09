package com.library.repository;

import java.util.Arrays;
import java.util.List;

public class BookRepository {

    // Method to get a list of books
    public List<String> getBooks() {
        return Arrays.asList("The Catcher in the Rye", "To Kill a Mockingbird", "1984", "The Great Gatsby");
    }
}
