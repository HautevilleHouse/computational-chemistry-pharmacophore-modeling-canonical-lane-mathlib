import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputationalChemistryPharmacophoreModelingCanonicalLaneLean

structure Conformer where
  id : Nat
  torsionAngles : List Float
  energy : Float
deriving Repr, DecidableEq

structure ConformerEnsemble where
  moleculeId : String
  conformers : List Conformer
  lowEnergyConformer : Conformer
deriving Repr, DecidableEq

def rmsd (c1 c2 : Conformer) : Float :=
  let diffSquared := List.zipWith (λ x y => (x - y)^2) c1.torsionAngles c2.torsionAngles
  Float.sqrt (diffSquared.foldl (·+·) 0.0 / (Float.ofNat diffSquared.length))

theorem rmsd_nonnegative (c1 c2 : Conformer) : rmsd c1 c2 ≥ 0.0 := by
  unfold rmsd
  have h : (c1.torsionAngles.zipWith (λ x y => (x - y)^2) c2.torsionAngles).foldl (·+·) 0.0 ≥ 0.0 := by
    refine List.foldl_nonneg (λ acc x => by
      nlinarith [sq_nonneg (x - ???)])
    sorry
  nlinarith

end ComputationalChemistryPharmacophoreModelingCanonicalLaneLean
end HautevilleHouse