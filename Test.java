import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class Test
{
    public static void main(String[] args)
    {
        JFrame frame = new JFrame("Test");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        JLabel label = new JLabel("");
        label.setPreferredSize(new Dimension(175, 100));
        frame.getContentPane().add(label, BorderLayout.CENTER);

        frame.pack();
        frame.setVisible(true);
    }
}
