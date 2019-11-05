import java.util.Random;

public class Person extends Thread{
	/*
	Martin Antonio Vivanco Palacios
	A01701167
	person that wait a random number to get inside the garden and then
	waiting to get outside
	*/
	private Random rnd;
	private Garden my_garden;

	public Person(Garden my_garden){
		rnd = new Random(System.currentTimeMillis());
		this.my_garden = my_garden;
	}
	public void run() {
		try {
			sleep(rnd.nextInt(100000));
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		my_garden.enter();
		try {
			sleep(rnd.nextInt(5000)+1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		my_garden.leave();
	}

}
