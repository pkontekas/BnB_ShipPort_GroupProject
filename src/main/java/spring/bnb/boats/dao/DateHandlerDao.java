package spring.bnb.boats.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author pkontekas
 */
public class DateHandlerDao {

    public Date stringToDate(String a) {
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        try {
            date = formatter.parse(a);

        } catch (ParseException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return date;
    }

    public float getDifferenceBetweenTwoDates(Date a, Date b) {
        float days;
        long diff = b.getTime() - a.getTime();
        System.out.println(diff);
        days = (diff / (1000 * 60 * 60 * 24));
        return days;
    }
}