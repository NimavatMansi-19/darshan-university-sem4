using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab2
{
    internal class Furniture
    {
        // Create a class Furniture with material ,price as data members. Create another class Table with Height,
        // surface_area as data members. Write a program to implement single inheritance. 
       public string material;
        public int price;
    }
    internal class Table : Furniture
    {
        int height;
        double surface_area;
        public Table()
        {
            height = 2;
            surface_area=2.3;
            material = "wood";
            price = 4000;
            Console.WriteLine(height+","+surface_area+","+material+","+price);

        }
    }
}
