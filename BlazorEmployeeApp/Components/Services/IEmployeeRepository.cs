using BlazorEmployeeApp.Components.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BlazorEmployeeApp.Components.Services
{
    public interface IEmployeeRepository
    {
        /*
         * GetEmployeesAsync: Retrieves all employees.
         * GetEmployeeByIdAsync: Retrieves a specific employee by ID.
         * AddEmployeeAsync: Adds a new employee.
         * UpdateEmployeeAsync: Updates an existing employee.
         * DeleteEmployeeAsync: Deletes an employee by ID.
         */
        Task<IEnumerable<EmployeeDto>> GetEmployeesAsync();

        /*Task<EmployeeDto> GetEmployeeByIdAsync(int employeeId);
        Task AddEmployeeAsync(EmployeeDto employee);
        Task DeleteEmployeeAsync(int employeeId);*/
        Task<IEnumerable<EmployeeDto>> SaveOrUpdate(EmployeeDto employee);
        
    }
}
