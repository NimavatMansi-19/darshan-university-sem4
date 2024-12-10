using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab2
{
    internal class Interest:Account_Details
    {
        //Write a program for implementing single inheritance which creates one class
        //Account_Details for getting account information and another
        // class Interest for  calculating and displaying total interest from the
        // data inserted from account details.
        double SI;
        public double calculating()
        {
            SI = (Principle * Rate * Time) / 100;
            return SI;
        }
        public void displaying()
        {
            Console.WriteLine("Simple Int is:: " + SI);
        }
    }
}
