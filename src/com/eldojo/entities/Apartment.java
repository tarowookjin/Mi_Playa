package com.eldojo.entities;
public class Apartment {
	private int id_apartamento;
	private int ano;
	private double costo_alquiler;
	private double costo_mantenimiento;
	private int edificio;
	private int recamaras;
	private String tipoApartamento;
	private int id_propietario;
	public Apartment()
	{
		
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public double getCosto_alquiler() {
		return costo_alquiler;
	}
	public void setCosto_alquiler(double costo_alquiler) {
		this.costo_alquiler = costo_alquiler;
	}
	public double getCosto_mantenimiento() {
		return costo_mantenimiento;
	}
	public void setCosto_mantenimiento(double costo_mantenimiento) {
		this.costo_mantenimiento = costo_mantenimiento;
	}
	public int getEdificio() {
		return edificio;
	}
	public void setEdificio(int edificio) {
		this.edificio = edificio;
	}
	public int getRecamaras() {
		return recamaras;
	}
	public void setRecamaras(int recamaras) {
		this.recamaras = recamaras;
	}
	public String getTipoApartamento() {
		return tipoApartamento;
	}
	public void setTipoApartamento(String tipoApartamento) {
		this.tipoApartamento = tipoApartamento;
	}
	public int getId_propietario() {
		return id_propietario;
	}
	public void setId_propietario(int id_propietario) {
		this.id_propietario = id_propietario;
	}
	
	public int getId_apartamento() {
		return id_apartamento;
	}
	public void setId_apartamento(int id_apartamento) {
		this.id_apartamento = id_apartamento;
	}
	

}
