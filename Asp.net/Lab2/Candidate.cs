using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab2
{
    internal class Candidate
    {
        // Write a program to create a class named Candidate with ID, Name, Age, Weight and Height as data members &
        // also create a member functions like GetCandidateDetails() and DisplayCandidateDetails().
        int ID;
        String Name;
        int Age;
        double Weight;
        double Height;
        public void GetCandidateDetails()
        {
            Console.WriteLine("Enter Your ID:");
            ID=Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Your Name:");
            Name =Console.ReadLine();
            Console.WriteLine("Enter Your Age:");
            Age = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Your Weight:");
            Weight = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("Enter Your Height:");
            Height = Convert.ToDouble(Console.ReadLine());

        }
        public void DisplayCandidateDetails()
        {
            Console.WriteLine("ID: " + ID);
            Console.WriteLine("Name: " + Name);
            Console.WriteLine("Age: " + Age);
            Console.WriteLine("Weigth: " + Weight);
            Console.WriteLine("Height: " + Height);
        }
    }
}
