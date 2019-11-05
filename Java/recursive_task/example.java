import java.math.BigInteger;
import java.util.Arrays;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.RecursiveTask;

public class FactorialTask extends RecursiveTask<BigInteger> {


	private static final int THRESHOLD = 100;
	private int start;
	private int end;

	public FactorialTask(int a, int b){
		start=a;
		end=b;
	}


	@Override
	protected BigInteger compute() {
		// TODO Auto-generated method stub

		if(end - start < THRESHOLD){
			BigInteger result = new BigInteger("1");
			for(int i=start; i < end; i++){
				result = result.multiply(BigInteger.valueOf(i));
			}
			return result;
		}else {
			int mid=(start+end)>>>1;
			FactorialTask t1, t2;
			t1=new FactorialTask(start,mid);
			t2=new FactorialTask(mid,end);
			t1.fork();
			return t2.compute().multiply(t1.join());

		}
	}

	public static void main(String[] args){
		int n = 100000;
		BigInteger resultado;

		System.out.println("parallel start");
		FactorialTask t=new FactorialTask(1,n+1);
		ForkJoinPool pool = new ForkJoinPool();
		resultado = pool.invoke(t);
		pool.shutdown();


		System.out.println("parallel done"+resultado);

	}

}
