

using bookCatalog.Domain.Entities;

namespace bookCatalog.Application.Interfaces
{
    public interface IBookRepository
    {
        Task AddAsync(Book book);
        Task<List<Book>> GetAllAsync();
        Task<Book?> GetByIdAsync(int id);
        Task UpdateAsync(Book book);

        Task DeleteAsync(int id);
    }
}
