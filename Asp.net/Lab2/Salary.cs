using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab2
{
    internal class salary
    {
        // Write a program to Define a class Salary which will contain member variable
        // Basic, TA, DA, HRA. Write a program using Constructor with default values
        // for DA and HRA and calculate the salary of employee.
        public double Basic;
        public double TA;
        public double DA;
        public double HRA;
   
        public salary(double basic, double ta, double da = 1000, double hra = 2000)
        {
            Basic = basic;
            TA = ta;
            DA = da;
            HRA = hra;
        }

        public void CalculateTotalSalary()
        {
             Console.WriteLine(Basic + TA + DA + HRA);
        }

}
}
