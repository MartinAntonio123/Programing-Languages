public class Main {
/*
Martin Antonio Vivanco Palacios
A01701167
declare the two runners and the length of the carrear
when one wins, declare both flags as false so the other
finishes as well
*/
	public static void main(String[] args) {
    int ftcarrear = 100000;
    Rabbit myrabbit = new Rabbit(ftcarrear);
    Turtle myturtle = new Turtle(ftcarrear);
    myrabbit.start();
    myturtle.start();

		while(myturtle.isAlive() && myrabbit.isAlive());
    myturtle.mystop();
    myrabbit.mystop();

	}
}
