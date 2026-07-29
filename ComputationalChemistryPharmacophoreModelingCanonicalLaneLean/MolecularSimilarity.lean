import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputationalChemistryPharmacophoreModelingCanonicalLaneLean

structure PharmacophoreFeature where
  featureType : String
  coordinates : List Float
  tolerance : Float
deriving Repr, DecidableEq

structure Molecule where
  name : String
  features : List PharmacophoreFeature
  activityLabel : Bool
deriving Repr, DecidableEq

def tanimotoCoefficient (fp1 fp2 : List Bool) : Float :=
  let intersection := (List.zip fp1 fp2).count (λ (a,b) => a ∧ b)
  let union := (List.zip fp1 fp2).count (λ (a,b) => a ∨ b)
  if union = 0 then 0.0 else (Float.ofNat intersection) / (Float.ofNat union)

theorem tanimoto_symmetry (fp1 fp2 : List Bool) : tanimotoCoefficient fp1 fp2 = tanimotoCoefficient fp2 fp1 := by
  unfold tanimotoCoefficient
  simp [List.zip, List.count]
  sorry

end ComputationalChemistryPharmacophoreModelingCanonicalLaneLean
end HautevilleHouse