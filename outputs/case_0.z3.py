from z3 import *

# 宣告變數
AssetLiabilityAllocationRisk_Property = Real('AssetLiabilityAllocationRisk_Property')
AssetRisk_Life = Real('AssetRisk_Life')
AssetRisk_Property = Real('AssetRisk_Property')
CAR = Real('CAR')
CreditRisk_Property = Real('CreditRisk_Property')
InsuranceRisk_Life = Real('InsuranceRisk_Life')
InterestRateRisk_Life = Real('InterestRateRisk_Life')
InvestmentTypeInsuranceAssets = Real('InvestmentTypeInsuranceAssets')
NWR = Real('NWR')
NWR_prev = Real('NWR_prev')
NetWorth = Real('NetWorth')
OtherRisk_Life = Real('OtherRisk_Life')
OtherRisk_Property = Real('OtherRisk_Property')
OwnCapital = Real('OwnCapital')
ResponsiblePersonAvgCompensationPrior12Months = Real('ResponsiblePersonAvgCompensationPrior12Months')
ResponsiblePersonCompensation = Real('ResponsiblePersonCompensation')
RiskCapital = Real('RiskCapital')
RiskCapital_Life = Real('RiskCapital_Life')
RiskCapital_Property = Real('RiskCapital_Property')
Tier1NonRestrictedCapital = Real('Tier1NonRestrictedCapital')
Tier1RestrictedCapital = Real('Tier1RestrictedCapital')
Tier2Capital = Real('Tier2Capital')
TotalAssets = Real('TotalAssets')
UnderwritingRisk_Property = Real('UnderwritingRisk_Property')
penalty = Bool('penalty')

# 宣告 Bool 變數
adequate = Bool('adequate')
inadequate = Bool('inadequate')
severely_inadequate = Bool('severely_inadequate')
significantly_inadequate = Bool('significantly_inadequate')
unknown = Bool('unknown')

# 宣告其他在 constraint 中出現的變數
insurance_capital_adequate_min_ratio = Real('insurance:capital_adequate_min_ratio')
insurance_net_worth_min_ratio = Real('insurance:net_worth_min_ratio')
insurance_capital_adequate = Bool('insurance:capital_adequate')
insurance_capital_inadequate = Bool('insurance:capital_inadequate')
insurance_capital_significantly_inadequate = Bool('insurance:capital_significantly_inadequate')
insurance_capital_severely_inadequate = Bool('insurance:capital_severely_inadequate')
insurance_capital_classification = Const('insurance:capital_classification', StringSort())
ImprovementPlanSubmitted = Bool('ImprovementPlanSubmitted')
ImprovementPlanExecuted = Bool('ImprovementPlanExecuted')
SignificantlyInadequateMeasuresImplemented = Bool('SignificantlyInadequateMeasuresImplemented')
SeverelyInadequateMeasuresImplemented = Bool('SeverelyInadequateMeasuresImplemented')
ProductRestrictionRequired = Bool('ProductRestrictionRequired')
ProductRestrictionImplemented = Bool('ProductRestrictionImplemented')
InvestmentRestrictionRequired = Bool('InvestmentRestrictionRequired')
InvestmentRestrictionImplemented = Bool('InvestmentRestrictionImplemented')
CompensationRestrictionRequired = Bool('CompensationRestrictionRequired')
CompensationRestrictionImplemented = Bool('CompensationRestrictionImplemented')
CompensationReductionRequired = Bool('CompensationReductionRequired')

# 建立 solver
s = Optimize()

# 加入 soft facts
s.add_soft(AssetLiabilityAllocationRisk_Property == 0.0)
s.add_soft(AssetRisk_Life == 0.0)
s.add_soft(AssetRisk_Property == 0.0)
s.add_soft(CAR == 111.09)
s.add_soft(CreditRisk_Property == 0.0)
s.add_soft(InsuranceRisk_Life == 0.0)
s.add_soft(InterestRateRisk_Life == 0.0)
s.add_soft(InvestmentTypeInsuranceAssets == 0.0)
s.add_soft(NWR == 2.97)
s.add_soft(NWR_prev == 2.97)
s.add_soft(NetWorth == 0.0)
s.add_soft(OtherRisk_Life == 0.0)
s.add_soft(OtherRisk_Property == 0.0)
s.add_soft(OwnCapital == 0.0)
s.add_soft(ResponsiblePersonAvgCompensationPrior12Months == 0.0)
s.add_soft(ResponsiblePersonCompensation == 0.0)
s.add_soft(RiskCapital == 0.0)
s.add_soft(RiskCapital_Life == 0.0)
s.add_soft(RiskCapital_Property == 0.0)
s.add_soft(Tier1NonRestrictedCapital == 0.0)
s.add_soft(Tier1RestrictedCapital == 0.0)
s.add_soft(Tier2Capital == 0.0)
s.add_soft(TotalAssets == 0.0)
s.add_soft(UnderwritingRisk_Property == 0.0)
s.add_soft(penalty == False)

# 加入 constraints
s.assert_and_track(CAR >= insurance_capital_adequate_min_ratio, "insurance:capital_adequacy_ratio_min")
s.assert_and_track(NWR >= insurance_net_worth_min_ratio, "insurance:net_worth_ratio_min")
s.assert_and_track(insurance_capital_adequate_min_ratio == 200.0, "insurance:capital_adequate_min_ratio")
s.assert_and_track(insurance_net_worth_min_ratio == 3.0, "insurance:net_worth_min_ratio")

s.assert_and_track(insurance_capital_adequate == And(CAR >= 200.0, Or(NWR >= 3.0, NWR_prev >= 3.0)), "insurance:capital_adequate")
s.assert_and_track(insurance_capital_inadequate == Or(
    And(CAR >= 150.0, CAR < 200.0),
    And(NWR < 3.0, NWR_prev < 3.0, Or(NWR >= 2.0, NWR_prev >= 2.0))
), "insurance:capital_inadequate")

s.assert_and_track(insurance_capital_significantly_inadequate == Or(
    And(CAR >= 50.0, CAR < 150.0),
    And(NWR < 2.0, NWR_prev < 2.0, NWR >= 0.0, NWR_prev >= 0.0)
), "insurance:capital_significantly_inadequate")

s.assert_and_track(insurance_capital_severely_inadequate == Or(
    CAR < 50.0,
    NetWorth < 0.0
), "insurance:capital_severely_inadequate")

s.assert_and_track(insurance_capital_classification == If(
    insurance_capital_severely_inadequate, 
    StringVal("severely_inadequate"),
    If(insurance_capital_significantly_inadequate,
       StringVal("significantly_inadequate"),
       If(insurance_capital_inadequate,
          StringVal("inadequate"),
          If(insurance_capital_adequate,
             StringVal("adequate"),
             StringVal("unknown"))
       )
    )
), "insurance:capital_classification")

s.assert_and_track(insurance_capital_classification, "insurance:capital_classification_priority")

s.assert_and_track(CAR == (OwnCapital / RiskCapital) * 100.0, "insurance:car_calculation")
s.assert_and_track(NWR == (NetWorth / (TotalAssets - InvestmentTypeInsuranceAssets)) * 100.0, "insurance:nwr_calculation")

s.assert_and_track(Or(
    Not(insurance_capital_classification == StringVal("inadequate")),
    ImprovementPlanSubmitted
), "insurance:improvement_plan_required")

s.assert_and_track(Or(
    Not(insurance_capital_classification == StringVal("inadequate")),
    Not(ImprovementPlanSubmitted),
    ImprovementPlanExecuted
), "insurance:improvement_plan_execution")

s.assert_and_track(Or(
    Not(insurance_capital_classification == StringVal("significantly_inadequate")),
    SignificantlyInadequateMeasuresImplemented
), "insurance:significantly_inadequate_measures")

s.assert_and_track(Or(
    Not(insurance_capital_classification == StringVal("severely_inadequate")),
    SeverelyInadequateMeasuresImplemented
), "insurance:severely_inadequate_measures")

s.assert_and_track(OwnCapital == Tier1NonRestrictedCapital + Tier1RestrictedCapital + Tier2Capital, "insurance:own_capital_composition")

s.assert_and_track(RiskCapital_Life == AssetRisk_Life + InsuranceRisk_Life + InterestRateRisk_Life + OtherRisk_Life, "insurance:risk_capital_life_insurance")

s.assert_and_track(RiskCapital_Property == AssetRisk_Property + CreditRisk_Property + UnderwritingRisk_Property + AssetLiabilityAllocationRisk_Property + OtherRisk_Property, "insurance:risk_capital_property_insurance")

s.assert_and_track(Or(
    Not(insurance_capital_classification == StringVal("inadequate")),
    Not(ProductRestrictionRequired),
    ProductRestrictionImplemented
), "insurance:inadequate_product_restriction")

s.assert_and_track(Or(
    Not(insurance_capital_classification == StringVal("inadequate")),
    Not(InvestmentRestrictionRequired),
    InvestmentRestrictionImplemented
), "insurance:inadequate_investment_restriction")

s.assert_and_track(Or(
    Not(insurance_capital_classification == StringVal("inadequate")),
    Not(CompensationRestrictionRequired),
    CompensationRestrictionImplemented
), "insurance:inadequate_compensation_restriction")

s.assert_and_track(Or(
    Not(insurance_capital_classification == StringVal("significantly_inadequate")),
    Not(CompensationReductionRequired),
    ResponsiblePersonCompensation <= ResponsiblePersonAvgCompensationPrior12Months * 0.7
), "insurance:significantly_inadequate_compensation_reduction")

s.assert_and_track(penalty == False, "meta:penalty_default_false")

s.assert_and_track(penalty == Not(Or(
    Not(CAR >= insurance_capital_adequate_min_ratio),
    Not(NWR >= insurance_net_worth_min_ratio),
    Not(Or(
        Not(insurance_capital_classification == StringVal("inadequate")),
        ImprovementPlanSubmitted
    )),
    Not(Or(
        Not(insurance_capital_classification == StringVal("inadequate")),
        Not(ImprovementPlanSubmitted),
        ImprovementPlanExecuted
    )),
    Not(Or(
        Not(insurance_capital_classification == StringVal("significantly_inadequate")),
        SignificantlyInadequateMeasuresImplemented
    )),
    Not(Or(
        Not(insurance_capital_classification == StringVal("severely_inadequate")),
        SeverelyInadequateMeasuresImplemented
    )),
    Not(Or(
        Not(insurance_capital_classification == StringVal("inadequate")),
        Not(ProductRestrictionRequired),
        ProductRestrictionImplemented
    )),
    Not(Or(
        Not(insurance_capital_classification == StringVal("inadequate")),
        Not(InvestmentRestrictionRequired),
        InvestmentRestrictionImplemented
    )),
    Not(Or(
        Not(insurance_capital_classification == StringVal("inadequate")),
        Not(CompensationRestrictionRequired),
        CompensationRestrictionImplemented
    )),
    Not(Or(
        Not(insurance_capital_classification == StringVal("significantly_inadequate")),
        Not(CompensationReductionRequired),
        ResponsiblePersonCompensation <= ResponsiblePersonAvgCompensationPrior12Months * 0.7
    ))
)), "meta:no_penalty_if_all_pass")

# 執行求解
result = s.check()
print(result)

if result == sat:
    m = s.model()
    print("penalty =", m[penalty])
    print("CAR =", m[CAR])
    print("NWR =", m[NWR])
    print("NWR_prev =", m[NWR_prev])
    print("capital_classification =", m[insurance_capital_classification])
else:
    print("UNSAT")
    print("Unsat core:", s.unsat_core())