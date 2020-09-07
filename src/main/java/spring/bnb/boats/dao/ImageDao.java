/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package spring.bnb.boats.dao;

import java.io.UnsupportedEncodingException;
import org.springframework.ui.ModelMap;

/**
 *
 * @author pkontekas
 */
public class ImageDao {

    public ModelMap encodeImageToBase64(byte[] imageBeforeEncoding, ModelMap mm, String imageName) {

        String base64EncodedImage = "";
        try {
            base64EncodedImage = new String(imageBeforeEncoding, "UTF-8");
        } catch (UnsupportedEncodingException ex) {
            //TO DO to fix this: If image does not exist we get an exception and we are thrown into error page
            ex.printStackTrace();
            mm.addAttribute("kindoferror", ex.getMessage());
        }
        //puts encoded image in a mm attribute to send it back in encoded format
        mm.addAttribute(imageName, base64EncodedImage);
        return mm;
    }
}
