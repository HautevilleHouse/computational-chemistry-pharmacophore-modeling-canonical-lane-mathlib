import canonicalLaneMathlib.AdmissibleClass
import ComputationalChemistryPharmacophoreModelingCanonicalLaneLean.MolecularSimilarity
import ComputationalChemistryPharmacophoreModelingCanonicalLaneLean.ConformerGeneration
import ComputationalChemistryPharmacophoreModelingCanonicalLaneLean.PharmacophoreAlignment
import ComputationalChemistryPharmacophoreModelingCanonicalLaneLean.VirtualScreening

namespace HautevilleHouse
namespace ComputationalChemistryPharmacophoreModelingCanonicalLaneLean

structure AdmittedObject where
  molecule : Molecule
  conformerEnsemble : ConformerEnsemble
  alignmentResult : Option AlignmentResult
  screeningHits : List ScreeningHit
deriving Repr

structure ConstrainedPharmacophoreClosure (A : AdmissibleClass) : Prop where
  bridgeClosed : Decides A.lane.solver A.lane.projectedLanguage
  gateClosed : A.endpointSatisfied ∨ A.remainderRecorded

theorem constrained_pharmacophore_endgame (A : AdmissibleClass) : ConstrainedPharmacophoreClosure A := by
  exact {
    bridgeClosed := A.solverDecidesProjectedLanguage
    gateClosed := A.gateWitness
  }

end ComputationalChemistryPharmacophoreModelingCanonicalLaneLean
end HautevilleHouse