using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            ////1. Write a program to print your name, address, contact number & city. 
            //Console.WriteLine("Nimavat Mansi Dilipbhai");
            //Console.WriteLine("Sarvad Ta:Maliya Dist:Morbi");
            //Console.WriteLine("XXXXXXXXXX");
            //Console.WriteLine("Morbi");

            // //2. Write a program to get two numbers from user and print those two numbers.
            // Console.WriteLine("Enter 1st number");
            //int a=Convert.ToInt32(Console.ReadLine());
            // Console.WriteLine("Enter 2nd number");
            // int b = Convert.ToInt32(Console.ReadLine());
            // Console.WriteLine("Your 1st number is:" + a);
            // Console.WriteLine("Your 2nd number is:"+b);

            ////3.Write program to prompt a user to input his/her name and country name  and then
            ////output will be shown as given: Hello <yourname> from country <countryname> 
            //Console.WriteLine("Enter your name");
            //String a=Console.ReadLine();
            //Console.WriteLine("Enter your country name");
            //String b = Console.ReadLine();
            //Console.WriteLine("Hello "+a+" from country "+b);

            //// 4.Write a program to calculate the size of the area
            //// in square-feet based on Specified length and width.
            // Console.WriteLine("Enter length");
            //int a=Convert.ToInt32(Console.ReadLine());
            // Console.WriteLine("Enter width");
            // int b = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Your area is " + a * b +"sq.ft");

            ////5. Write a program to calculate area of Square, Rectangle and Circle. 
            //Console.WriteLine("Enter length ");
            //int a = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Enter width ");
            //int b = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Enter radius ");
            //int c = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Area of Square is " + a * a);
            //Console.WriteLine("Area of Rectangle is " + a * b);
            //Console.WriteLine("Area of Circle is:" + Math.PI * c * c);

            ////6.Write a program to calculate Celsius to Fahrenheit and vice-versa using function.
            //Console.WriteLine("Enter Celsius ");
            //double c=Convert.ToDouble(Console.ReadLine());
            //Console.WriteLine("Fahrenheit is " + Far(c));
            //Console.WriteLine("Enter Fahrenheit ");
            //double f = Convert.ToDouble(Console.ReadLine());
            //Console.WriteLine("Fahrenheit is "+Cel(f));

            //7. Write a program to find out Simple Interest using function. (I = PRN/100) 
            //Console.WriteLine("Enter 1st number ");
            //int p= Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Enter 2nd number ");
            //int r = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Enter 3rd number ");
            //int n = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("SI is " + SI(p, r, n));



            ////8.Write a program to create a Simple Calculator for two numbers 
            ////(Addition, Multiplication, Subtraction, Division) [Also using if…else & Switch Case] Write a program to create a Simple Calculator for two numbers (Addition, Multiplication, Subtraction, Division)
            ////[Also using if…else & Switch Case]
            //Console.WriteLine("Enter 1st number ");
            //int a = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Enter 2nd number ");
            //int b = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Enter the operator ");
            //char c = Convert.ToChar(Console.ReadLine());
            //if (c == '+')
            //{
            //    Console.WriteLine("Addition of " + a + "+" + b + "is " + (a + b));
            //}
            //else if(c=='-')
            //{
            //    Console.WriteLine("Subtraction of " + a + "-" + b + "is " + (a - b));
            //}
            //else if (c == '*')
            //{
            //    Console.WriteLine("Multiplication of " + a + "*" + b + "is " + (a * b));
            //}
            //else if (c == '/')
            //{
            //    Console.WriteLine("Division of " + a + "/" + b + "is " +Convert.ToDouble (Convert.ToDouble(a) / Convert.ToDouble(b)));
            //}
            //else
            //{
            //    Console.WriteLine("Invalid Operator");
            //}

            ////9.Write a program to Swapping without using third variable. 
            //Console.WriteLine("Enter 1st number ");
            //int a = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Enter 2nd number ");
            //int b = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("old numbers are:" + a + " " + b);
            //a = a -b ;
            //b = a + b;
            //a = b - a;

            //Console.WriteLine("New numbers are;" + a + " " + b);

            ////10. Write a program to find maximum numbers from given 3
            ////numbers using ternary operator. 
            //Console.WriteLine("Enter 1st number ");
            //int a = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Enter 2nd number ");
            //int b = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Enter 1st number ");
            //int c = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("Maximum is " +( (a > b) ? ((a > c) ? a : c):((b>c) ? b : c)));
            //char val = Console.Read();
            //Console.WriteLine(val);
        }
        static double Far(double x)
        {
            return (x*9/5)+32;
        }
        static double Cel(double x)
        {
            return (x - 32) * 5 / 9;
        }
        static double SI(int x, int y, int z)
        {
            return ((Convert.ToDouble(x) * Convert.ToDouble(y) * Convert.ToDouble(z)) / 100.0);
        }
    }
}
