
package net.crud.bookmanager.dao;

import net.crud.bookmanager.model.Book;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class BookDaoImpl implements BookDao {
    private static final Logger logger = LoggerFactory.getLogger(BookDaoImpl.class);
    private static final int limitResultsPerPage = 10;
    private static StandardServiceRegistry registry;
    private  SessionFactory sessionFactory;

    public  void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = getSessionFactory();
    }

    public  SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {

                //Configuration c = new Configuration().configure().addAnnotatedClass(Book.class);
                registry = new StandardServiceRegistryBuilder()
                        .configure()
                        .build();

                MetadataSources sources = new MetadataSources(registry);
                Metadata metadata = sources.getMetadataBuilder().build();
                sessionFactory = metadata.getSessionFactoryBuilder().build();

            } catch (Exception e) {
                e.printStackTrace();
                if (registry != null) {
                    StandardServiceRegistryBuilder.destroy(registry);
                }
            }
        }
        return sessionFactory;
    }

      @Override
    public void addBook(Book book) {
        Session session = getSessionFactory().openSession();
        session.beginTransaction();
        session.save(book);
        session.flush();
        session.getTransaction().commit();
        logger.info("Book successfully saved. Book details: " + book);

    }

    @Override
    public void readedBook(Book book) {
        Session session = getSessionFactory().openSession();
        session.beginTransaction();
        if (!book.isReadAlready())
        {
            book.setReadAlready(true);
        }
        session.update(book);
        session.flush();
        session.getTransaction().commit();
        logger.info("Book successfully update. Book details: " + book);

    }

    @Override
    public void replacedBook(Book book) {
        Session session = getSessionFactory().openSession();
        session.beginTransaction();
        if (book.isReadAlready())
        {
            book.setReadAlready(false);
        }
        session.update(book);
        session.flush();
        session.getTransaction().commit();
        logger.info("Book successfully update. Book details: " + book);
    }

    @Override
    public void removeBook(int id) {
        Session session = getSessionFactory().openSession();
        session.beginTransaction();
        Book book = (Book) session.load(Book.class, id);

        if(book!=null){
            session.delete(book);
        }
        session.flush();
        session.getTransaction().commit();
        logger.info("Book successfully removed. Book details: " + book);
    }

    @Override
    public Book getBookById(int id) {
        Session session = getSessionFactory().openSession();
        session.beginTransaction();
        Book book = (Book) session.load(Book.class, id);
        session.getTransaction().commit();
        logger.info("Book successfully loaded. Book details: " + book);
        return book;
    }

    @Override
    public List<Book> getBooks(Long page) {
        Session session = getSessionFactory().openSession();
        session.beginTransaction();
        org.hibernate.query.Query<Book> query = session.createQuery("from  Book", Book.class);
        query.setFirstResult((int)(page - 1) * limitResultsPerPage);
        query.setMaxResults(limitResultsPerPage);
        return query.list();
    }

    @Override
    public List<Book> getBooks(String name) {
        Session session = getSessionFactory().openSession();
        session.beginTransaction();
        org.hibernate.query.Query<Book> query = session.createQuery("from  Book where title like :NAME", Book.class);
        query.setParameter("NAME", "%" + name + "%");
        return query.list();
    }

}
