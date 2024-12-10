using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab4
{
    internal class Program
    {
        static void Main(string[] args)
        {
            ////1. Write a program using method overloading by changing datatype of arguments to perform addition
            ////of two integer numbers and two float  numbers.
            //Sum(3, 4);
            //Sum(3.3, 4.2);

            ////2. Write a program using method overloading by changing number of
            ////arguments to calculate area of square and rectangle.
            //Area(3);
            //Area(3, 4);

            ////3. Create a class named RBI with calculateInterest() method. Create another    classes HDFC, SBI, ICICI
            ////which overrides calculateInterest() method.
            //HDFC h=new HDFC();
            //h.calculateInterest(300, 400, 5);
            //SBI s=new SBI();    
            //s.calculateInterest(300,400,5);
            //ICICI i=new ICICI();
            //i.calculateInterest(300, 400, 5);
            //RBI r=new RBI();
            //r.calculateInterest(300, 400, 5);

            ////4. Create a class Hospital with HospitalDetails() method. Create another  classes Apollo, Wockhardt,
            ////Gokul_Superspeciality which overrides  HospitalDetails() method.
            //Gokul_Superspeciality g=new Gokul_Superspeciality();
            //g.HospitalDetails();
            //Apollo a=new Apollo();
            //a.HospitalDetails();
            //Wockhardt w=new Wockhardt();    
            //w.HospitalDetails();
            //Hospital h=new Hospital();
            //h.HospitalDetails();

            ////5. Write a programs to Find Area of Square, Rectangle and Circle using Method Overloading.
            //Area(3);
            //Area(4.0);
            //Area(3, 4);

            //6. Create a BankAccount class having constructor accepting initialBalance and accountHolderName.
            //Also create Deposite() and withdraw() overloaded methods by which user can deposit/withdraw amount using
            //different types of parameters (ex. cash, check). 
            BankAccount b = new BankAccount(5000, "Mansi");
            b.Withdraw(5000);
            b.Deposite(1000);
            b.Deposite("Cash",4000);
            b.Withdraw("Check",3000);

        }
        public static void Sum(int n,int m)
        {
            Console.WriteLine("Ans++" + (m + n));
        }
        public static void Sum(double n, double m)
        {
            Console.WriteLine("Ans++" + (m + n));
        }
        public static void Area(int r)
        {
            Console.WriteLine("Area of Circle is::"+(Math.PI*r*r));
        }
        public static void Area(int l,int b)
        {
            Console.WriteLine("Area of Rectangle is::"+(l*b));
        }
        public static void Area(double r)
        {
            Console.WriteLine("Area of Square is::" + (r * r));
        }
    }
}
