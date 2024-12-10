using System;
using System.Collections.Generic;
using System.IO.Pipes;
using System.Linq;
using System.Linq.Expressions;
using System.Security.Permissions;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Schema;

namespace lab3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            ////1. Write a program to Create a divide by zero exception and handle it. 
            //int a = 5;
            //int b = 0;
            //int ans;
            //try
            //{
            //    ans = a / b;
            //}
            //catch (DivideByZeroException)
            //{
            //    Console.WriteLine("Exception occured....");
            //}

            // Write a program that reads 5 numbers from user.
            // Demonstrate concept of IndexOutOfRange Exception.

            //int[] a = new Int32[5];
            //try
            //{
            //    for (int i = 0; i <= a.Length; i++)
            //    {
            //        a[i] = Convert.ToInt32(Console.ReadLine());
            //    }


            //}
            //catch (IndexOutOfRangeException)
            //{
            //    Console.WriteLine("Exception Occuried");
            //}

            // // Write a program to create an abstract class Sum having abstract
            // // methods SumOfTwo(int a, int b) and SumOfThree(int a, int b,int c).Create another class
            // // Calculate which extends the abstract class and implements the abstract methods. 
            // Calculate s=new Calculate();
            //Console.WriteLine( s.SumOfTwo(2, 3));
            // Console.WriteLine(s.SumOfThree(2, 3,4));

            ////Write a program to create interface Calculate. In this interface we have two
            ////member functions Addition() and Subtraction(). Implements this interface in another class
            ////named Result. 
            // Result r=new Result();
            //Console.WriteLine(r.Addition(4, 3));
            //Console.WriteLine(r.Subtraction(4, 3));

            ////// Write program showing use of common methods of String class. 
            //string s = "I am Learning .net";
            //string s2 = " Yeah";
            ////Console.WriteLine(s.ToUpper());
            ////Console.WriteLine(s.ToLower());
            ////Console.WriteLine(string.Concat(s,s2));
            ////Console.WriteLine(s.CompareTo(s2));
            ////Console.WriteLine(s2.CompareTo(s));
            ////Console.WriteLine(s.IndexOf("a"));

            ////Write a program to Replace lower case characters to upper case and  Vice-versa. 
            //Console.WriteLine(s.ToUpper());
            //Console.WriteLine(s.ToLower());

            ////Write a program to create interface named Shape. In this interface, we have three methods Circle(),
            ////Triangle() and Square() which calculates area of Circle, Triangle and Square respectively.
            ////Implement Shape interface.

            //Area a=new Area();
            //Console.WriteLine(a.Circle(3));
            //Console.WriteLine(a.Triangle(3,2));
            //Console.WriteLine(a.Square(3));

            //// Write a program to accept a number from the user and throw an exception if the number is not an even number.
            //int a = Convert.ToInt32(Console.ReadLine());

            //    if (a % 2 == 0)
            //    {
            //        throw new Exception("You cannot enter even number");
            //    }

            //else
            //{
            //    Console.WriteLine("Your no.is accepted");
            //}

            //Write a program to find the longest word in a stringC
            Console.WriteLine("Enter your String:");
            string s = Console.ReadLine();
            int max = 0;

            string[] s2 = s.Split(' ');
            for (int i = 0; i < s2.Length; i++)
            {
                int maxw = 0;
                for (int j= 0; j < s2[i].Length; j++)
                {  
                    maxw++;
                }
                max=(maxw>max)?maxw:max;
            }
            for (int i = 0; i < s2.Length; i++)
            {
                if (s2[i].Length == max)
                {
                    Console.WriteLine(s2[i]);
                }
            }

            //// Write a program to change the case of entered character. 
            //char c=Convert.ToChar(Console.ReadLine());
            //if (Char.IsUpper(c))
            //{
            //    Console.WriteLine(Char.ToLower(c));
            //}
            //else
            //{
            //    Console.WriteLine(Char.ToUpper(c));
            //}

        }

    }
}
