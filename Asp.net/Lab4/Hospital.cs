using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab4
{
    internal class Hospital
    {
        //4. Create a class Hospital with HospitalDetails() method. Create another  classes Apollo, Wockhardt,
        //Gokul_Superspeciality which overrides  HospitalDetails() method.

        public virtual void HospitalDetails()
        {
            Console.WriteLine("Hi Welcome to hospital method:");
        }
    }
    internal class Apollo : Hospital
    {
        public override void HospitalDetails()
        {
            Console.WriteLine("Hi Welcome to Apollo hospital method:");
        }
    }
    internal class Wockhardt : Hospital
    {
        public override void HospitalDetails()
        {
            Console.WriteLine("Hi Welcome to Wockhardt hospital method:");
        }
    }
    internal class Gokul_Superspeciality : Hospital
    {
        public override void HospitalDetails()
        {
            Console.WriteLine("Hi Welcome to Gokul_Superspeciality hospital method:");
        }
    }
}
