using Dapper;
using Microsoft.Data.SqlClient;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Data;
using BlazorEmployeeApp.Components.Models;

namespace BlazorEmployeeApp.Components.Services;
public class EmployeeRepository : IEmployeeRepository
{
    private readonly IConfiguration _config;
    public EmployeeRepository(IConfiguration config) => _config = config;

    public async Task<IEnumerable<EmployeeDto>> GetEmployeesAsync()
    {
        using var conn = new SqlConnection(_config.GetConnectionString("DefaultConnection"));
        return await conn.QueryAsync<EmployeeDto>("GetEmployeesWithTitles", commandType: CommandType.StoredProcedure);
    }

    //SaveOrUpdate method handles both adding and updating employees
    public async Task<IEnumerable<EmployeeDto>> SaveOrUpdate(EmployeeDto employee)
    {
        using var conn = new SqlConnection(_config.GetConnectionString("DefaultConnection"));
        var parameters = new DynamicParameters();
        parameters.Add("@EmployeeId", employee.EmployeeID, DbType.Int32, ParameterDirection.Input);
        parameters.Add("@FirstName", employee.FirstName, DbType.String, ParameterDirection.Input);
        parameters.Add("@LastName", employee.LastName, DbType.String, ParameterDirection.Input);
        parameters.Add("@TitleId", employee.EmployeeTitleID, DbType.Int32, ParameterDirection.Input);
        parameters.Add("@BirthDate", employee.DOB, DbType.DateTime, ParameterDirection.Input);
        return await conn.QueryAsync<EmployeeDto>("InsertEmployee", parameters, commandType: CommandType.StoredProcedure);
    }

    // ... implement other CRUD methods...
}