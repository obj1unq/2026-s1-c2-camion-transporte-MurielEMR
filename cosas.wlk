object knightRider {
	method peso() { 
		return 500 
	}
	method nivelPeligrosidad() {
		 return 10 
	}
	method cantidadDeBultos(){
		return 1
	}
	method accidente(){
	}
}
object arenaAGranel{
	var property peso = 50
	method nivelPeligrosidad() {
		 return 1 
	}
	method cantidadDeBultos(){
		return 1
	}
	method accidente(){
		peso = peso + 20
	}
}

object bumblebee{
	var property modo = modoAuto
	method peso() { 
		return 800
	}
	method nivelPeligrosidad() {
		 return 15*modo.nivelPeligro() 
	}
	method cantidadDeBultos(){
		return 2
	}
	method accidente(){
		modo.cambiarModo()
	}


}
object modoAuto{
	method nivelPeligro(){
		return 1 
	}
	method cambiarModo(){
		bumblebee.modo(modoRobot)
		
	}

}
object modoRobot{
	method nivelPeligro(){
		return 2
	}
	method cambiarModo(){
		bumblebee.modo(modoAuto)
		
	}

}
object paqueteDeLadrillos{
	var property cantidadLadrillos = 0
	method peso() { 
		return cantidadLadrillos*ladrillo.peso()
	}
	method nivelPeligrosidad() {
		 return 2
	}
	method cantidadDeBultos(){
		return if(cantidadLadrillos < 101){
			1
		}else if(cantidadLadrillos < 301){
			2
		} else{
			3
		}
	}
	method accidente(){
		if(cantidadLadrillos >12){
			cantidadLadrillos = cantidadLadrillos - 12
		} else{ 
			cantidadLadrillos = 0
		}
	}
}
object ladrillo{
	method peso(){
		return 2
	}
}
object bateriaAntiaerea {
	var property estaCargado = false
	method peso() { 
		return if (estaCargado){
			300
		} else {
			200
			}
		
	}
	method nivelPeligrosidad() {
		 return if (estaCargado){
			100
		 }else {
			0
		 }
	}
	method cantidadDeBultos(){
		return if (self.estaCargado()){
			2
		} else {
			1
		}
	}
	method accidente(){
		estaCargado = false
	}
}

object residuosRadiactivos{
	var property peso = 0
	method nivelPeligrosidad() {
		 return 200 
	}
	method cantidadDeBultos(){
		return 1
	}
	method accidente(){
		peso = peso + 15
	}
}

object contenedorPortuario{
	const property cosas = #{}
	method cargar(unaCosa){
		cosas.add(unaCosa)
	}

	method peso(){
		return 100 + self.pesoTotalDeCosas()
	}
	method pesoDeTodasLasCosas(){
		return cosas.map{cosa => cosa.peso()}
	}
	method pesoTotalDeCosas(){
		if (cosas.isEmpty()){
			return 0
		}else {
		return self.pesoDeTodasLasCosas().sum()
		}
	}
	method nivelPeligrosidad(){
		if (cosas.isEmpty()){
			return 0
		}else {
			return self.nivelDeObjetoMasPeligroso()
		}
	}
	method nivelDeObjetoMasPeligroso(){
		return (cosas.map{c => c.nivelPeligrosidad()}).max()
	}
	method cantidadDeBultos(){
		return self.totalDeBultosTransportados() + 1
	}
	method totalDeBultosTransportados(){
		return cosas.sum({cosas => cosas.cantidadDeBultos()})
	}
	method accidente(){
		cosas.forEach{cosa => cosa.accidente()}
	}
}

object embalajeDeSeguridad{
	var property envuelve = null

	method peso(){
		return envuelve.peso() 
	}
	method nivelPeligrosidad(){
		return envuelve.nivelPeligrosidad()/2
	}
	method cantidadDeBultos(){
		return 2 + envuelve.cantidadDeBultos()
	}
	method accidente(){
	}

}


