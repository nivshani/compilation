public class example_04
{
    public static void foo(String s)
    {
        if (s.charAt(14+s.length()) == 'a')
        {
            s = "MMM";
        }
    }
    public static void main(String[] args)
    {
        foo(args[0]);
    }
}
