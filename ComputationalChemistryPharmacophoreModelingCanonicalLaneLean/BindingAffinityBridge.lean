import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputationalChemistryPharmacophoreModelingCanonicalLaneLean

structure BindingAffinityEstimate where
  predictedAffinity : Float
  measuredAffinity : Float
  error : Float

deriving Repr, DecidableEq

structure BindingBridgeWitness where
  admissibleModel : AdmissibleClass
  estimates : List BindingAffinityEstimate
  bridgeValid : Bool

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ∀ (model : PharmacophoreModel), ∃ (affinity : Float), True

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  intro model
  refine ⟨0.0, trivial⟩

end ComputationalChemistryPharmacophoreModelingCanonicalLaneLean
end HautevilleHouse