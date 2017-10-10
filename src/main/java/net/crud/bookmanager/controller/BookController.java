package net.crud.bookmanager.controller;

import net.crud.bookmanager.model.Book;
import net.crud.bookmanager.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
public class BookController {
    private BookService bookService;

    @Autowired(required = true)
    @Qualifier(value = "bookService")

    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping(value = "books", method = RequestMethod.GET)
    public String listBooks(@RequestParam(value="page", required = false) Long page, Model model) {
        if (null == page)
            page = 1L;
        model.addAttribute("book", new Book());
        model.addAttribute("searchedbook", new Book());
        model.addAttribute("listBooks", this.bookService.getBooks(page));
        model.addAttribute("page", page);

        return "books";
    }

    @RequestMapping(value = "/books/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book) {
        this.bookService.addBook(book);
        return "redirect:/books";
    }

    @RequestMapping(value = "/books/read", method = RequestMethod.POST)
    public String readedBook(@ModelAttribute("book") Book book) {
        this.bookService.readedBook(book);
        return "redirect:/books";
    }

    @RequestMapping(value = "/books/replaced", method = RequestMethod.POST)
    public String replacedBook(@ModelAttribute("book") Book book) {
        this.bookService.replacedBook(book);
        return "redirect:/books";
    }

    @RequestMapping("/remove/{id}")
    public String removeBook(@PathVariable("id") int id) {
        this.bookService.removeBook(id);

        return "redirect:/books";
    }

    @RequestMapping("read/{id}")
    public String editBook(@PathVariable("id") int id, @RequestParam(value="page", required = false) Long page, Model model) {
        if (null == page) page = 1L;
        model.addAttribute("book", this.bookService.getBookById(id));
        model.addAttribute("searchedbook", new Book());
        model.addAttribute("listBooks", this.bookService.getBooks(page));
        model.addAttribute("page", page);

        return "readedBook";
    }

    @RequestMapping("replaced/{id}")
    public String replacedBook(@PathVariable("id") int id, @RequestParam(value="page", required = false) Long page, Model model) {
        if (null == page) page = 1L;
        model.addAttribute("book", this.bookService.getBookById(id));
        model.addAttribute("searchedbook", new Book());
        model.addAttribute("listBooks", this.bookService.getBooks(page));
        model.addAttribute("page", page);

        return "replacedBook";
    }

    @RequestMapping("bookdata/{id}")
    public String bookData(@PathVariable("id") int id, Model model) {
        model.addAttribute("book", this.bookService.getBookById(id));

        return "bookdata";
    }

    @RequestMapping("addbook")
    public String createBook(@ModelAttribute("book") Book book) {
        return "addbook";
    }

    @RequestMapping(value="searchresults", method = RequestMethod.POST)
    public String searchResults(@ModelAttribute("searchedbook") Book book, Model model) {
        List<Book> searchResult = this.bookService.getBooks(book.getTitle());
        model.addAttribute("listBooks", searchResult);

        return "searchresults";
    }
}