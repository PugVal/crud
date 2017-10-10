package net.crud.bookmanager.service;

import net.crud.bookmanager.dao.BookDao;
import net.crud.bookmanager.model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDao bookDao;

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @Override
    public void addBook(Book book) {
        this.bookDao.addBook(book);
    }

    @Override
    public void readedBook(Book book) {
        this.bookDao.readedBook(book);
    }

    @Override
    public void replacedBook(Book book) {
        this.bookDao.replacedBook(book);
    }

    @Override
    public void removeBook(int id) {
        this.bookDao.removeBook(id);
    }

    @Override
    public Book getBookById(int id) {
        return this.bookDao.getBookById(id);
    }

    @Override
    public List<Book> getBooks(Long page) {
        return this.bookDao.getBooks(page);
    }

    @Override
    public List<Book> getBooks(String title) {
        return this.bookDao.getBooks(title);
    }

}
