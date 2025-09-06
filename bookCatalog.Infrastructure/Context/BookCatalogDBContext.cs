

using bookCatalog.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace bookCatalog.Infrastructure.Context
{
    public class BookCatalogDBContext:DbContext
    {
        public BookCatalogDBContext(DbContextOptions<BookCatalogDBContext> options):base(options)
        {
            
            
        }
        public DbSet<Book> Books { get; set; }
    }
}
