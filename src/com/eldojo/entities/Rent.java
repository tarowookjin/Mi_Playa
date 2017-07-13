package com.eldojo.entities;

public class Rent {
	private int codigo;
	private String fecha_entrada;
	private String fecha_salida;
	private float monto;
	private int cantPersonas;
	private String tipoApartamento;
	private String tipoPago;
	public Rent()
	{
		fecha_entrada="";
		fecha_salida="";
		tipoPago="";
		monto = 0;
		cantPersonas=0;
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
	public int getCantPersonas() {
		return cantPersonas;
	}
	public void setCantPersonas(int cantPersonas) {
		this.cantPersonas = cantPersonas;
	}
	public String getTipoApartamento() {
		return tipoApartamento;
	}
	public void setTipoApartamento(String tipoApartamento) {
		this.tipoApartamento = tipoApartamento;
	}
	public String getTipoPago() {
		return tipoPago;
	}
	public void setTipoPago(String tipoPago) {
		this.tipoPago = tipoPago;
	}

}
