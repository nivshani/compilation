using System;
namespace ARITH
{
    class MUL
    {
    	static int foo(int x, int y, int z)
    	{
    		int t=77;
    		return x+y+z+t;
    	}
        static void Main(string[] args) 
        {
        	foo(1,2,foo(3,4,5));
        }
    }
}

