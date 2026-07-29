import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputationalChemistryPharmacophoreModelingCanonicalLaneLean

structure ScreeningHit where
  moleculeId : String
  score : Float
  active : Bool
deriving Repr, DecidableEq

def enrichmentFactor (hits : List ScreeningHit) (totalActives : Nat) : Float :=
  let topPct := (hits.length * 5) / 100 -- top 5%
  let topHits := hits.take topPct
  let foundActives := (topHits.filter (λ h => h.active)).length
  if totalActives = 0 then 0.0
  else (Float.ofNat foundActives * (Float.ofNat hits.length)) / (Float.ofNat topPct * Float.ofNat totalActives)

theorem enrichment_factor_nonnegative (hits : List ScreeningHit) (totalActives : Nat) : enrichmentFactor hits totalActives ≥ 0.0 := by
  unfold enrichmentFactor
  split
  · nlinarith
  · positivity

end ComputationalChemistryPharmacophoreModelingCanonicalLaneLean
end HautevilleHouse