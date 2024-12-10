using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab4
{
    internal class BankAccount
    {

        //6. Create a BankAccount class having constructor accepting initialBalance and accountHolderName.
        //Also create Deposite() and withdraw() overloaded methods by which user can deposit/withdraw amount using
        //different types of parameters (ex. cash, check). 
        int initialBalance;
        string accountHolderName;
        string type;
        public  BankAccount(int initialBalance, string accountHolderName)
        {
            this.initialBalance = initialBalance;
            this.accountHolderName = accountHolderName;
        }
        public  void Deposite(int balance)
        {
            Console.WriteLine("Deposited by "+ accountHolderName+"Total balance is "+(initialBalance+balance));
        }
        public  void Withdraw(int balance)
        {
            Console.WriteLine("withdraw by " + accountHolderName + "Total balance is " + (initialBalance - balance));
        }
        public void Deposite(string type, int balance)
        {
            Console.WriteLine("Deposited by " + accountHolderName + "Total balance is " + (initialBalance + balance)+"and payment type is "+type);
        }
        public void Withdraw(String type,int balance)
        {
            Console.WriteLine("withdraw by " + accountHolderName + "Total balance is " + (initialBalance - balance) + "and payment type is " + type);
        }
    }

    
}
