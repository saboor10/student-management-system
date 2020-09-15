/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Close.Frame;

import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import javax.swing.AbstractAction;
import javax.swing.JComponent;
import javax.swing.JFrame;

import javax.swing.KeyStroke;


public class CloseFrame  {
    JFrame frame ;
    public CloseFrame(String Cancel, JFrame frame){
        this.frame = frame;
        frame.getRootPane().getInputMap(JComponent.WHEN_IN_FOCUSED_WINDOW)
              .put(KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0),Cancel);
               frame.getRootPane().getActionMap().put(Cancel, new AbstractAction() {
            @Override
            public void actionPerformed(ActionEvent ae) {
                System.exit(0);
            }
        });
    }
}
