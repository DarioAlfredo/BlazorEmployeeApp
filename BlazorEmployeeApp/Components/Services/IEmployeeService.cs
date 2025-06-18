using BlazorEmployeeApp.Components.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BlazorEmployeeApp.Components.Services
{
    public interface IEmployeeService
    {
        Task<IEnumerable<EmployeeDto>> GetEmployeesAsync();
        Task<IEnumerable<EmployeeDto>> SaveOrUpdate(EmployeeDto employee);
    }
}
