using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab2
{
    internal class Bank_Account
    {
        // Write a pogram to Create a class Bank_Account with Account_No, Email, User_Name,
        // Account_Type and Account_Balance as data members.
        // Also create a Member function GetAccountDetails() & DisplayAccountDetails(). 
        int Account_No;
        String Email;
        String User_Name;
        String Account_Type;
        double Account_Balance;
        public void GetAccountDetails()
        {
            Console.WriteLine("Enter Your Account_No:");
            Account_No = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Your Email:");
            Email = Console.ReadLine();
            Console.WriteLine("Enter Your User_Name:");
            User_Name = Console.ReadLine();
            Console.WriteLine("Enter Your Account_Type:");
            Account_Type = Console.ReadLine();
            Console.WriteLine("Enter Your Account_Balance:");
            Account_Balance = Convert.ToDouble(Console.ReadLine());

        }
        public void DisplayAccountDetails()
        {
            Console.WriteLine("Account_No: " + Account_No);
            Console.WriteLine("Email: " + Email);
            Console.WriteLine("User_Name: " + User_Name);
            Console.WriteLine("Account_Type: " + Account_Type);
            Console.WriteLine("Height: " + Account_Balance);
        }
    }
}
