import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputationalChemistryPharmacophoreModelingCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure PharmacophoreFeaturePoint where
  x : Float
  y : Float
  z : Float
  featureType : String

deriving Repr, DecidableEq

structure PharmacophoreModel where
  features : List PharmacophoreFeaturePoint
  tolerance : Float
  activityCliff : Bool

deriving Repr, DecidableEq

structure PharmacophoreAdmittedObject where
  model : PharmacophoreModel
  projectedLanguage : Language
  solver : DecisionProcedure

def pharmacophoreProjection : Projection (AdmissibleClass) := {
  toFun := fun A => A,
  idempotent := by intro A; rfl
}

theorem pharmacophore_projection_idempotent (A : AdmissibleClass) :
    pharmacophoreProjection.toFun (pharmacophoreProjection.toFun A) = pharmacophoreProjection.toFun A := by
  exact pharmacophoreProjection.idempotent A

end ComputationalChemistryPharmacophoreModelingCanonicalLaneLean
end HautevilleHouse