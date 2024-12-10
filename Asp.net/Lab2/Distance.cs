using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab2
{
    internal class Distance
    {
        //Write a program to Define a class Distance have data members dist1, dist2, dist3.
        //Initialize the two data members using constructor and store their addition in third data member using
        //function and display addition. 
        public double dist1;
        public double dist2;
        public double dist3;
        public Distance(double d1, double d2)
        {
            dist1 = d1;
            dist2 = d2;
        }
        public void CalculateAddition()
        {
            dist3 = dist1 + dist2;
        }


        public void DisplayAddition()
        {
            Console.WriteLine("The addition of distances" + dist1 + "+" + dist2 + "=" + dist3);
        }

        }
    }
