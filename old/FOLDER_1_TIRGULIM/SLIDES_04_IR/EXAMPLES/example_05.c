int foo(int a,int b,int c)
{
	return a+b*c;
}
int x=46;
int main()
{
	int i=8;
	int j=17;

	return foo(i+j,x,i-j);
}
