import java.util.Random;

public class PiThread extends Thread{
	private double toss, toss_number, number_in_circle ;
	private Random  rnd;
	
	public PiThread(double toss, double toss_number){
		rnd = new Random(System.currentTimeMillis());
		this.toss = toss;
		this.toss_number = toss_number;
		number_in_circle = 0;
	}
	public void run() {
		double x, y;
		for (; toss < toss_number; toss++) 
		{ 
			x = rnd.nextDouble();
			y = rnd.nextDouble();
			if ((x*x + y*y) <= 1) {
				setNumber_in_circle(getNumber_in_circle() + 1); 
			}
		} 
		System.out.println("end thread");
	}
	public double getNumber_in_circle() {
		return number_in_circle;
	}
	public void setNumber_in_circle(double number_in_circle) {
		this.number_in_circle = number_in_circle;
	}
	
}
