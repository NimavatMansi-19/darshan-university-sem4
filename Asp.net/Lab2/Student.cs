using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Lab2
{
    internal class Student
    {
        //Write a program with following specifications:  Class Name: Student
        //Data Members: Enrollment_No, Student_Name, Semester, CPI and SPI
        //Get Students Details using constructor and DisplayStudentDetails() using member function.
        long Enrollment_No;
        String Student_Name;
        int Semester;
        double CPI;
        double SPI;

        public Student() {
            Console.WriteLine("Enter Your Enrollment_No:");
            this.Enrollment_No = Convert.ToInt64(Console.ReadLine());
            Console.WriteLine("Enter Your Name:");
            this.Student_Name = Console.ReadLine();
            Console.WriteLine("Enter Your Semester:");
            this.Semester = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Your CPI:");
            this.CPI = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("Enter Your SPI:");
            this.SPI = Convert.ToDouble(Console.ReadLine());
        }
        public void DisplayStudentDetails()
        {
            Console.WriteLine("Enrollment_No: " + Enrollment_No);
            Console.WriteLine("Name: " + Student_Name);
            Console.WriteLine("Semester: " + Semester);
            Console.WriteLine("CPI: " + CPI);
            Console.WriteLine("SPI: " + SPI);
        }
    }
}
