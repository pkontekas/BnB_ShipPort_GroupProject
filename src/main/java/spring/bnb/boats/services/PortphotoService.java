package spring.bnb.boats.services;

import java.sql.Blob;

public interface PortphotoService {
    
        public Blob getPortphotoById(int id);
}
