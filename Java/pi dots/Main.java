import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		double number_in_circle = 0 , toss_number;
		System.out.println("numero de puntos: ");
		toss_number = scanner.nextDouble();
		scanner.close();
		long time = System.currentTimeMillis();
		PiThread threads[] =  new PiThread[10];
		for(int i = 0; i < 4; i++) {
			threads[i] = new PiThread(0, toss_number/4);
			threads[i].start();
		}
		for(int i = 0; i < 4; i++) {
			try {
				threads[i].join();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		for(int i = 0; i < 4; i++) {
			number_in_circle = number_in_circle + threads[i].getNumber_in_circle();
			System.out.println("get number");
		}
		
		double pi_estimate = 4 * number_in_circle/( toss_number);
		time = System.currentTimeMillis() - time;
		System.out.println("number ="+ number_in_circle);
		System.out.println("pi ="+ pi_estimate + " time: " + time);
	}
}
