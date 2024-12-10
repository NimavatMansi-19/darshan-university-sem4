using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;

namespace Lab2
{
    internal class Account_Details
    {
        //Write a program for implementing single inheritance which creates one class
        //Account_Details for getting account information and another
        // class Interest for  calculating and displaying total interest from the
        // data inserted from account details.
        public int Principle;
        public double Rate;
        public int Time;
        public Account_Details() {
            Console.WriteLine("Enter Your Principle amount:");
            this.Principle = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Your Rate:");
            this.Rate = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("Enter Your Time:");
            this.Time = Convert.ToInt32(Console.ReadLine());

        }
    }
}
