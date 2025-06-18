using BlazorEmployeeApp.Components.Models;
using BlazorEmployeeApp.Components.Services;

namespace BlazorEmployeeApp.Components.Data
{
    public class EmployeeService : IEmployeeService
    {
        private readonly IEmployeeRepository _employeeRepository;
        public EmployeeService(IEmployeeRepository employeeRepository)
        {
            _employeeRepository = employeeRepository;
        }

        public async Task<IEnumerable<EmployeeDto>> GetEmployeesAsync()
        {
            return await _employeeRepository.GetEmployeesAsync();
        }

        // Implement other methods by delegating to _employeeRepository as needed
    }
}