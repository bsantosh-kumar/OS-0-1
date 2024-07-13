#include<stdlib.h>
int i;
void foo();

int main(int argc,char *argv[]){
	int *i=malloc(sizeof(int));
	foo();
	foo();
	return 0;
}

void foo(){}
