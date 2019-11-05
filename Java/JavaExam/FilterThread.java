import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

public class FilterThread extends Thread{
  private int begin, rows, cols, red, green, blue;
  private BufferedImage img;

  public FilterThread(int rows, int cols, int begin, BufferedImage img, int red, int green, int blue){
    this.begin = begin;
    this.rows = rows;
    this.cols = cols;
    this.img = img;
    this.red = red;
    this.green = green;
    this.blue = blue;
  }

  public void run(){
    for(int i = begin; i<rows; i++){
      for (int j = 0; j<cols; j++ ) {

        int rgb = img.getRGB(j, i);
        int red = rgb & 0xFF;
        int green = (rgb >> 8) & 0xFF;
        int blue = (rgb >> 16) & 0xFF;

        float L = (float) (0.2126 * (float) red + 0.7152 * (float) green + 0.0722 * (float) blue);

        int color;
        color = this.red * (int) L / 255;
        color = (color << 8) | this.green * (int) L / 255;
        color = (color << 16) | this.blue * (int) L / 255;

        img.setRGB(j, i, color);
      }
    }
  }

}
