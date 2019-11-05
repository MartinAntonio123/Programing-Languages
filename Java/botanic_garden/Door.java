import java.util.Random;

public class Door extends Thread{
	/*
	Martin Antonio Vivanco Palacios
	A01701167
	door that creates n threads of people and sent the garden as a parameter
	*/
	private int people;
	private Random rnd;
	private Garden my_garden;

	public Door(int people, Garden my_garden){
		this.people = people;
		this.my_garden = my_garden;
	}
	public void run() {
		Person threads[] =  new Person[people];
		for(int i = 0; i < people; i++) {
			threads[i] = new Person(my_garden);
			threads[i].start();
		}
		for(int i = 0; i < people; i++) {
			try {
				threads[i].join();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("end thread");
	}
}
