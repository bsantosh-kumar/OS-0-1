void test(){}

int main(int argc,char *argv[]){
asm ("mov eax,0");
asm("mov ebx,0");
asm("int 0x80");

}
