namespace BlazorEmployeeApp.Components.Models;

public class EmployeeDto
{
    public int EmployeeID { get; set; }
    public int? EmployeeTitleID { get; set; }
    public string FirstName { get; set; } = string.Empty;
    public string LastName { get; set; } = string.Empty;
    public DateTime DOB { get; set; }
    public bool IsActive { get; set; }
    public string? EmployeeTitle { get; set; } // For joined title
}
