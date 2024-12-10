using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab3
{
    internal class Result:Calculates
    {
        //Write a program to create interface Calculate. In this interface we have two
        //member functions Addition() and Subtraction(). Implements this interface in another class
        //named Result.
        
        public int Addition(int a,int b)
        {
            return a + b;
        }
        public int Subtraction(int a, int b)
        {
            return a - b;
        }

    }
}
