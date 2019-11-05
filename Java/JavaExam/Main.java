import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
//main class
public class Main{
  private static final int MAXTHREADS = Runtime.getRuntime().availableProcessors();

    public static void main(String[] args) throws IOException {

        // creation  of threw¡eads equal to procesors available
        // this thread creation is general purpouse
        BufferedImage img = ImageIO.read(new File("image1.jpg"));
        int numRows = img.getHeight();
        int numCols = img.getWidth();
        FilterThread threads[] = new FilterThread[MAXTHREADS];

        for (int i = 0; i < threads.length; i++) {
          //adjust las 3 parameters for filter colour
          threads[i] = new FilterThread((i+1)*(numRows/threads.length), numCols, i*(numRows/threads.length), img, 220, 10, 220);
        }
        //start threads and waits for them to finish to aviod race conditions
        //when rewriting the image
        double startTime = System.currentTimeMillis();
  			for (int i = 0; i < threads.length; i++) {
  				threads[i].start();
  			}

  			for (int i = 0; i < threads.length; i++) {
  				try {
  					threads[i].join();
  				} catch (InterruptedException e) {
  					e.printStackTrace();
  				}
  			}
        // checks the elapsed time
  			double stopTime = System.currentTimeMillis();
  			double acum =  (stopTime - startTime);
        System.out.println("Elapsed Time: "+acum);
        ImageIO.write(img, "jpg", new File("newimage.jpg"));
        System.out.print("Finished");
    }
}
