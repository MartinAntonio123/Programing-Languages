import java.util.Random;
/*
Martin Antonio Vivanco Palacios
A01701167
turtle runs until the distance ia greater than the goal
or the flag is false, the flag becomes false when the
rabbit wins
*/
public class Turtle extends Thread{
	private int goal, distance;
	private Random  rnd;
  private int running;

	public Turtle(int goal){
		rnd = new Random(System.currentTimeMillis());
    this.goal = goal;
    this.distance = 0;
    this.running = 1;
	}
	public void run() {
		int run;
		while((distance < goal)&&(running == 1))
		{
			run =  rnd.nextInt(7)+3;
      distance=distance+run;
		}
		if (running==1) {
			System.out.println("Turtle finished");
		}
	}
  public void mystop(){
    this.running = 0;
  }

}
