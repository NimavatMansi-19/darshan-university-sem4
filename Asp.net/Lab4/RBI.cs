using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab4
{
    internal class RBI
    {
        //3. Create a class named RBI with calculateInterest() method. Create another    classes HDFC, SBI, ICICI
        //which overrides calculateInterest() method.
        public virtual void calculateInterest(int p,int r,int n)
        {
            Console.WriteLine("RBI Interest is " + ((p * r * n) / 100));
        }
    }
    internal class HDFC : RBI
    {
        public override void calculateInterest(int p, int r, int n)
        {
            Console.WriteLine("HDFC Interest is " + ((p * r * n) / 100));
        }
    }
    internal class SBI : RBI
    {
        public override void calculateInterest(int p, int r, int n)
        { 
            Console.WriteLine("SBI Interest is " + ((p * r * n) / 100));
        }
    }
    internal class ICICI : RBI
    {
        public override void calculateInterest(int p, int r, int n)
        {
            Console.WriteLine("ICICI Interest is " + ((p * r * n) / 100));
        }
    }
}
