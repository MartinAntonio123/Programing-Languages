import java.util.Scanner;
/*
Martin Antonio Vivanco Palacios
A01701167
declare the two doors and ask for the persons entering
create the doors and a gardend that is a synchronized object
*/
public class Main {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int doora;
		System.out.println("Persons entering: ");
		doora = scanner.nextInt();
		scanner.close();
		long time = System.currentTimeMillis();

		Garden my_garden = new Garden();
		Door my_door_a =  new Door(doora, my_garden);
		Door my_door_b =  new Door(doora, my_garden);
		my_door_a.start();
		my_door_b.start();

		try {
			my_door_a.join();
			my_door_b.join();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
