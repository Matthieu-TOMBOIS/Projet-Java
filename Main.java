/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projetjava;
/*https://docs.oracle.com/javase/tutorial/displayCode.html?code=https://docs.oracle.com/javase/tutorial/uiswing/examples/layout/TabDemoProject/src/layout/TabDemo.java*/
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class Main {
final static String BUTTONPANEL = "Emploi du temps";
    final static String TEXTPANEL = "Salles";
    final static int extraWindowWidth = 100;
 
    public void addComponentToPane(Container pane) {
        JTabbedPane tabbedPane = new JTabbedPane();
 
        //Create the "cards".
        JPanel card1 = new JPanel() {
            //Make the panel wider than it really needs, so
            //the window's wide enough for the tabs to stay
            //in one row.
            public Dimension getPreferredSize() {
                Dimension size = super.getPreferredSize();
                size.width += extraWindowWidth;
                return size;
            }
        };
        card1.add(new JButton("Lundi"));
        card1.add(new JButton("Mardi"));
        card1.add(new JButton("Mercredi"));
        card1.add(new JButton("Jeudi"));
        card1.add(new JButton("Vendredi"));
        card1.add(new JButton("Samedi"));
        card1.add(new JTextField("Saisie du Nom", 20));
        
 
        JPanel card2 = new JPanel();
        card2.add(new JButton("Matière - Public"));
        card2.add(new JButton("Première seéance"));
        card2.add(new JButton("Dernière seéance"));
        card2.add(new JButton("Durée"));
        card2.add(new JButton("Nombre"));
 
        tabbedPane.addTab(BUTTONPANEL, card1);
        tabbedPane.addTab(TEXTPANEL, card2);
 
        pane.add(tabbedPane, BorderLayout.CENTER);
    }
 
    /**
     * Create the GUI and show it.  For thread safety,
     * this method should be invoked from the
     * event dispatch thread.
     */
    private static void createAndShowGUI() {
        //Create and set up the window.
        JFrame frame = new JFrame("TabDemo");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
 
        //Create and set up the content pane.
        Main demo = new Main();
        demo.addComponentToPane(frame.getContentPane());
 
        //Display the window.
        frame.pack();
        frame.setVisible(true);
    }
 
    public static void main(String[] args) {
        /* Use an appropriate Look and Feel */
        try {
            //UIManager.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
            UIManager.setLookAndFeel("javax.swing.plaf.metal.MetalLookAndFeel");
        } catch (UnsupportedLookAndFeelException ex) {
            ex.printStackTrace();
        } catch (IllegalAccessException ex) {
            ex.printStackTrace();
        } catch (InstantiationException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        /* Turn off metal's use of bold fonts */
        UIManager.put("swing.boldMetal", Boolean.FALSE);
         
        //Schedule a job for the event dispatch thread:
        //creating and showing this application's GUI.
        javax.swing.SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                createAndShowGUI();
            }
        });
    }
}