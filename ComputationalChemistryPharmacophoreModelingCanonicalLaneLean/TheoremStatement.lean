import HautevilleHouse.ComputationalChemistryPharmacophoreModelingCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace ComputationalChemistryPharmacophoreModelingCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  pharmacophoreConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

end ComputationalChemistryPharmacophoreModelingCanonicalLaneLean
end HautevilleHouse