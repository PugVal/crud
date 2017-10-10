package net.crud.bookmanager.dao;

import net.crud.bookmanager.model.Book;
import java.util.List;

public interface BookDao {
     void addBook(Book book);
     void readedBook(Book book);
     void replacedBook(Book book);
     void removeBook(int id);
     Book getBookById(int id);
     List<Book> getBooks(Long page);
     List<Book> getBooks(String title);
}
