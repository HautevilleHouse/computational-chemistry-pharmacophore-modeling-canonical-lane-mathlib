import HautevilleHouse.ComputationalChemistryPharmacophoreModelingCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ComputationalChemistryPharmacophoreModelingCanonicalLaneLean

def ConstrainedPharmacophoreClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_pharmacophore_endgame (A : AdmissibleClass) :
    ConstrainedPharmacophoreClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ComputationalChemistryPharmacophoreModelingCanonicalLaneLean
end HautevilleHouse