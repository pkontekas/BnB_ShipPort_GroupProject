package spring.bnb.boats.messages;

/**
 * @author pkontekas
 */
public class ResponseMessage {
//will be used in future refactoring
    private String message;

    public ResponseMessage(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
