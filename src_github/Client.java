
public class Client {
	private int cod_cli;
	private String nombre;
	private String direccion;
	private String telefono;
	private Client(int cod_cli, String nombre, String direccion, String telefono){
		this.cod_cli=cod_cli;
		this.nombre=nombre;
		this.direccion=direccion;
		this.telefono=telefono;
	}
	public int getCod_cli() {
		return cod_cli;
	}
	public void setCod_cli(int cod_cli) {
		this.cod_cli = cod_cli;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
}
