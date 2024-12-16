using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.ConstrainedExecution;
using System.Text;
using System.Threading.Tasks;

namespace Lab_5
{
    internal class Program
    {
        static void Main(string[] args)
        {
            ////1. Create an ArrayList for StudentName and perform following operations:
            ////a. Add() - To Add new student in list
            ////b. Remove() - To Remove Student with specified index
            ////c. RemoveRange() - To Remove student with specified range.
            ////d. Clear()
            ////- To clear all the student from the list 
            //ArrayList StudentName = new ArrayList();
            //StudentName.Add("Mansi");
            //StudentName.Add("Darshi");
            //StudentName.Add("Shruti");
            //StudentName.Add("Riya");
            //StudentName.Add("Nandani");
            //StudentName.Remove("Mansi");
            ////StudentName.RemoveAt(4);
            //StudentName.RemoveRange(0, 2);
            //StudentName.Clear();
            //foreach (string i in StudentName)
            //{
            //    Console.WriteLine(i);
            //}

            //// 2.Create a List for StudentName and perform following operations:
            //// a.Add() - To Add new student in list
            //// b.Remove() - To Remove Student with specified index
            //// c.RemoveRange() - To Remove student with specified range.
            //// d.Clear() - To clear all the student from the list
            //List<string> StudentName = new List<string>();
            // StudentName.Add("Mansi");
            // StudentName.Add("Darshi");
            // StudentName.Add("Shruti");
            // StudentName.Add("Riya");
            // StudentName.Add("Nandani");

            // StudentName.Remove("Riya");
            // StudentName.RemoveRange(0, 3);
            // StudentName.Clear();
            // foreach (string i in StudentName)
            // {
            //     Console.WriteLine(i);
            // }

            // //3. Create a Stack which takes integer values and perform following operations:
            // //a. Push() - To Add new item in stack
            // //b. Pop() - To Remove item from the stack
            // //c. Peek() – To Return the top item from the stack.
            // //d. Contains() - To Checks whether an item exists in the stack or not.
            // //e. Clear() - To clear items from stack 

            // Stack s=new Stack();
            // s.Push(1);
            // s.Push(2);
            // s.Push(3);
            // s.Push(4);
            // s.Push(5);
            // Console.WriteLine("Poped Element is :"+s.Pop());
            //Console.WriteLine("Peeked Element is "+s.Peek());//does not delete only return top element
            // Console.WriteLine(s.Contains(3));
            // s.Clear();
            // foreach(int i in s)
            // {
            //     Console.WriteLine(i);
            // }

            // //4.Create a Queue which takes integer values and perform following operations:
            // //    a.Enqueue() - Adds an item into the queue.
            // //    b.Dequeue() - Returns an item from the beginning of the queue and removes it from the queue.
            // //    c.Peek() - Returns an first item from the queue without removing it.
            // //    d.Contains() - Checks whether an item is in the queue or not
            // //    e.Clear() - Removes all the items from the queue

            // Queue q=new Queue();
            // q.Enqueue(1);
            // q.Enqueue(2);
            // q.Enqueue(3);
            // q.Enqueue(4);
            // q.Enqueue(5);
            //Console.WriteLine("Removed element is: "+ q.Dequeue());
            // Console.WriteLine("Top most element is : " + q.Peek());
            // q.Clear();
            //  foreach (int i in q)
            // {
            //     Console.WriteLine(i);
            // }

            //// Create a Dictionary collection class object and preform following operations:
            //// a.Add: Adds a key-value pair.
            //// b.Remove: Removes a key-value pair by key.
            //// c.ContainsKey: Checks if a key exists in the hashtable.
            //// d.ContainsValue: Checks if a value exists in the hashtable.
            //// e.Clear: Removes all key-value pairs. 
            //Dictionary<String, Int32> d = new Dictionary<String, Int32>();
            //d.Add("Maths", 45);
            //d.Add("Science", 28);
            //d.Add("English", 34);
            //d.Remove("Maths");
            //Console.WriteLine(d.ContainsKey("Maths"));
            //Console.WriteLine(d.ContainsValue(34));
            //d.Clear();
            //foreach (KeyValuePair<String, int> i in d)
            //{
            //    Console.WriteLine("Key is " + i.Key + " Value is " + i.Value);
            //}


            //6. Create a Hashtable collection class object and preform following operations:
            //a. Add: Adds a key-value pair.
            //b. Remove: Removes a key-value pair by key.
            //c. ContainsKey: Checks if a key exists in the hashtable.
            //d. ContainsValue: Checks if a value exists in the hashtable.
            //e. Clear: Removes all key-value pairs. 

            Hashtable ht = new Hashtable();
            ht.Add("Maths", 45);
            ht.Add("Science", 28);
            ht.Add("English", 34);
            ht.Remove("Science");
            Console.WriteLine(ht.ContainsValue(34));
            Console.WriteLine(ht.ContainsKey("English"));
            ht.Clear();
            foreach (DictionaryEntry i in ht)
            {
                Console.WriteLine("Key is: " + i.Key+ " Value is: "+i.Value );
            }










        }
    }
}
