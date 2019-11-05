import java.util.Random;
/*
Martin Antonio Vivanco Palacios
A01701167
rabbit runs until the distance is greater than the current run
then rest for the time of the current rest variable and keeps
running until the distance is greater than the goal
or the flag is false, the flag becomes false when the
turtle wins
*/
public class Rabbit extends Thread{
	private int goal, distance;
	private Random  rnd;
  private int running;

	public Rabbit(int goal){
		rnd = new Random(System.currentTimeMillis());
    this.goal = goal;
    this.distance = 0;
    this.running = 1;
	}
	public void run() {
		int run, rest;
		while((distance < goal)&&(running == 1))
		{
			run =  rnd.nextInt(501)+500;
			rest = rnd.nextInt(101)+100;
      distance=distance+run;
      try {
				sleep(rest);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		if (running==1) {
			System.out.println("Rabbit finished");
		}
	}

  public void mystop(){
    this.running = 0;
  }

}
