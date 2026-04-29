object knightRider {
	method peso() { 
		return 500 
	}
	method nivelPeligrosidad() {
		 return 10 
	}
}
object arenaAGranel{
	var property peso = 50
	method nivelPeligrosidad() {
		 return 1 
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

}
object modoAuto{
	method nivelPeligro(){
		return 1 
	}

}
object modoRobot{
	method nivelPeligro(){
		return 2
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
}

object residuosRadiactivos{
	var property peso = 0
	method nivelPeligrosidad() {
		 return 200 
	}
}


