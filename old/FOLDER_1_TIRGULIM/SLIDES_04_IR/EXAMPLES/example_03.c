typedef struct P {
	int ID;
	int age;
	int height;
	int weight;
} P;

int main()
{
	P *p;
	p->weight = 78;
	return p->age;
}
