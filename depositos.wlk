import formacion.*
import locomotoras.*

class Deposito{
    const formaciones = []
    const locomotoras = []

    method agregarFormacion(unaFormacion) {
      formaciones.add(unaFormacion)
    }

    method agregarLocomotora(unaLocomotora) {
      locomotoras.add(unaLocomotora)
    }

    method conjuntoVagonesPesados() {
      return formaciones.map({f=>f.vagonMasPesado()}).asSet()
    }

    method necesitaConductorExperimentado() {
      return formaciones.any({f=>f.esCompleja()})
    }

    method agregarLocomotoraAFormacion(unaFormacion){
        if (not unaFormacion.puedeMoverse()){
            const locomotoraAdecuada = locomotoras.find({l=>l.empuje()>=unaFormacion.kilosParaMoverse()})
            if(locomotoraAdecuada != null){
                unaFormacion.agregarLocomotora(locomotoraAdecuada)
            }
            // unaFormacion.agregarLocomotora(locomotoras.find({l=>l.empuje()>=unaFormacion.kilosParaMoverse()}))
        }
    }
}
