using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab2
{
    internal class Staff
    {
        //Write a program to create a class Staff having data members as Name, Department, Designation, Experience &
        //Salary. Accept this data for
        //5 different staffs and display only names & salary of those staff who are HOD.
       public String Name;
       public String Designation;
       public int Experience;
       public double Salary;
        public void GetDetails()
        {
            Console.WriteLine("Enter Your Name:");
            Name = Console.ReadLine();
            Console.WriteLine("Enter Your Designation:");
            Designation = Console.ReadLine();
            Console.WriteLine("Enter Your Experience:");
            Experience = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Your Salary:");
            Salary = Convert.ToDouble(Console.ReadLine());

        }
        public void Display()
        {
            Console.WriteLine("Name is: "+Name);
            Console.WriteLine("Salary is: "+Salary);    
        }
        public void GetDesignation(String Designation)
        {
            if (Designation == "HOD" || Designation == "hod")
            {
                Display();
            }
        }
    }
}
