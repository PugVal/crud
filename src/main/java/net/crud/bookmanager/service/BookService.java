package net.crud.bookmanager.service;

import net.crud.bookmanager.model.Book;

import java.util.List;

public interface BookService {
     void addBook(Book book);
     void readedBook(Book book);
     void replacedBook(Book book);
     void removeBook(int id);
     Book getBookById(int id);
     List<Book> getBooks(Long page);
     List<Book> getBooks(String title);
}
