package cafe;

@SuppressWarnings("serial")
public class HasOrderingException extends Exception {
	public HasOrderingException() {
	}

	public HasOrderingException(String message) {
		super(message);
	}
}
