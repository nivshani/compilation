class A { public:
	virtual int WALK(int x,int y){return x-y;}
	virtual int RUN( int x,int y){return x*y;}
	virtual int SWIM(int x,int y,int z){return x+y-z;}
};
class B : public A { public:
	virtual int SWIM(int x,int y,int z){return 222;}
	virtual int RUN( int x,int y){return x+1;}
};
class C : public B { public:
	virtual int STUDY(){ return 333; }
	virtual int SWIM(int x,int y,int z){return 9;}
};
int x=44;
int main()
{
	A *p;
	return p->SWIM(3,x,7);
}
