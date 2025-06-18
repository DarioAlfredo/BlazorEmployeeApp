using BlazorEmployeeApp.Components.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BlazorEmployeeApp.Components.Services
{
    public interface IEmployeeService
    {
        Task<IEnumerable<EmployeeDto>> GetEmployeesAsync();
        // Add other service method signatures as needed
    }
}
