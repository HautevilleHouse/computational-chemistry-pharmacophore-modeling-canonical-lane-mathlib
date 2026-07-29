import HautevilleHouse.ComputationalChemistryPharmacophoreModelingCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ComputationalChemistryPharmacophoreModelingCanonicalLaneLean

structure AdmissibleClass where
  lane : PharmacophoreAdmittedObject
  solverDecidesProjectedLanguage : Decides lane.solver lane.projectedLanguage
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  Decides A.lane.solver A.lane.projectedLanguage ∧
  (A.endpointSatisfied ∨ A.remainderRecorded)

end ComputationalChemistryPharmacophoreModelingCanonicalLaneLean
end HautevilleHouse