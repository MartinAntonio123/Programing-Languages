public class Garden{
	/*
	Martin Antonio Vivanco Palacios
	A01701167
	Garden that have the count of the people in ti with synchronized
	methods
	*/
	private double people;

	public Garden(){
		this.people = 0;
	}
	public synchronized void enter() {
		this.people++;
		System.out.println("enter, "+people+" people in the Garden");
	}
	public synchronized void leave() {
		this.people--;
		System.out.println("exit, "+people+" people in the Garden");
	}
}
