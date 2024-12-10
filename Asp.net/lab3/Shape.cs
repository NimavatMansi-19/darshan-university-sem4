using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab3
{
    internal interface Shape
    {
        //Write a program to create interface named Shape. In this interface, we have three methods Circle(),
        //Triangle() and Square() which calculates area of Circle, Triangle and Square respectively.
        //Implement Shape interface.
        double Circle(int r);
        double Triangle(int l, int b);
        double Square(int l);
    }
    internal class Area : Shape
    {
        public double Circle(int r)
        {
            return Math.PI * r;

        }
        public double Triangle(int l, int b)
        {
            return 0.5 * l * b;
        }
        public double Square(int l)
        {
            return l * l;
        }
    }
}
