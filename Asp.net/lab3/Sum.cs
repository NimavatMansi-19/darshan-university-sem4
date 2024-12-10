using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab3
{
    internal abstract class Sum
    {
        // Write a program to create an abstract class Sum having abstract
        // methods SumOfTwo(int a, int b) and SumOfThree(int a, int b,int c).
        // Create another class Calculate which extends the abstract class and implements the abstract methods. 
        public int a;
        public int b;
        public int c;
       public abstract  int SumOfTwo(int a, int b);
         public abstract int SumOfThree(int a, int b,int c);
    }
}
