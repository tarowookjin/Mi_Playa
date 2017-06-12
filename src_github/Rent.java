
public class Rent {
	private int codigo;
	private String fecha_entrada;
	private String fecha_salida;
	private float monto;
	private Rent(int codigo, String fecha_entrada, String fecha_salida, float monto){
		this.codigo=codigo;
		this.fecha_entrada=fecha_entrada;
		this.fecha_salida=fecha_salida;
		this.monto=monto;
	}
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getFecha_entrada() {
		return fecha_entrada;
	}
	public void setFecha_entrada(String fecha_entrada) {
		this.fecha_entrada = fecha_entrada;
	}
	public String getFecha_salida() {
		return fecha_salida;
	}
	public void setFecha_salida(String fecha_salida) {
		this.fecha_salida = fecha_salida;
	}
	public float getMonto() {
		return monto;
	}
	public void setMonto(float monto) {
		this.monto = monto;
	}

}
