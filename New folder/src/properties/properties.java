/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package properties;
import javax.swing.ImageIcon;
/**
 *
 * @author Saboor
 */
public class properties {
    private ImageIcon icon =null;
    private String titles;
    public properties(){
    }
    public ImageIcon getImage(){
     return icon;
    }
    public void setImage(ImageIcon icon){
       this.icon = icon;
    }
    public String getTitle(){
    return titles;
    }
    public void setTitle(String titles){
    this.titles = titles;
    }

    public static class TextHolder {

        public TextHolder() {
        }
    }

  

   
}
