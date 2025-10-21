; SMT2 file generated from compliance case automatic
; Case ID: case_252
; Generated at: 2025-10-21T05:33:41.606643
;
; This file can be executed with Z3:
;   z3 case_252.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approved_by_authority Bool)
(declare-const beneficiary_certificate_audit Bool)
(declare-const beneficiary_certificate_issuance Bool)
(declare-const beneficiary_certificate_mandatory_items Bool)
(declare-const business_sanctions Bool)
(declare-const business_sanctions_executed Bool)
(declare-const capital_use_compliance Bool)
(declare-const certificate_audited Bool)
(declare-const certificate_format_compliant Bool)
(declare-const certificate_signed_by_custodian Bool)
(declare-const compensation_responsibility Bool)
(declare-const complies_company_law_16_1 Bool)
(declare-const executive_sanction_executed Bool)
(declare-const executive_sanction_ordered Bool)
(declare-const executive_violation_affecting_business Bool)
(declare-const falsehood_prohibited Bool)
(declare-const financial_report_false_or_hidden Bool)
(declare-const financial_report_truthful Bool)
(declare-const fraud_prohibited Bool)
(declare-const guarantee_and_pledge_prohibition Bool)
(declare-const has_executive_violation_affecting_business Bool)
(declare-const has_falsehood Bool)
(declare-const has_fraud Bool)
(declare-const has_misleading Bool)
(declare-const includes_beneficiary_name Bool)
(declare-const includes_beneficiary_units Bool)
(declare-const includes_fund_name_and_units_and_dates Bool)
(declare-const includes_management_and_custody_fee_methods Bool)
(declare-const includes_nav_calculation_and_announcement Bool)
(declare-const includes_other_mandatory_items Bool)
(declare-const includes_purchase_price_and_fees Bool)
(declare-const includes_redemption_procedures_and_fees Bool)
(declare-const includes_transfer_restrictions_and_effects Bool)
(declare-const includes_trustee_and_custodian_info Bool)
(declare-const misleading_prohibited Bool)
(declare-const no_loan_to_others Bool)
(declare-const no_other_non_business_use Bool)
(declare-const no_purchase_non_operating_real_estate Bool)
(declare-const penalty Bool)
(declare-const use_approved_securities_investment_trust_fund Bool)
(declare-const use_bank_deposits Bool)
(declare-const use_government_bonds Bool)
(declare-const use_other_approved_uses Bool)
(declare-const use_treasury_bills_or_commercial_papers Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:falsehood_prohibited] 不得有虛偽行為
(assert (not (= has_falsehood falsehood_prohibited)))

; [securities:fraud_prohibited] 不得有詐欺行為
(assert (not (= has_fraud fraud_prohibited)))

; [securities:misleading_prohibited] 不得有其他足致他人誤信之行為
(assert (not (= has_misleading misleading_prohibited)))

; [securities:financial_report_truthful] 財務報告及相關業務文件內容不得有虛偽或隱匿
(assert (not (= financial_report_false_or_hidden financial_report_truthful)))

; [securities:beneficiary_compensation_responsibility] 違反虛偽、詐欺或誤信規定者應負賠償責任
(assert (= compensation_responsibility
   (or (not fraud_prohibited)
       (not misleading_prohibited)
       (not falsehood_prohibited)
       (not financial_report_truthful))))

; [securities:capital_use_compliance] 資金運用符合規定限制
(assert (= capital_use_compliance
   (and no_loan_to_others
        no_purchase_non_operating_real_estate
        no_other_non_business_use
        (or use_other_approved_uses
            use_approved_securities_investment_trust_fund
            use_bank_deposits
            use_treasury_bills_or_commercial_papers
            use_government_bonds))))

; [securities:guarantee_and_pledge_prohibition] 不得為保證、票據背書或提供財產擔保，除非符合公司法第16條第1項且經核准
(assert (= guarantee_and_pledge_prohibition
   (or approved_by_authority complies_company_law_16_1)))

; [securities:beneficiary_certificate_issuance] 受益憑證應依主管機關格式載明應記載事項並簽署後發行
(assert (= beneficiary_certificate_issuance
   (and certificate_format_compliant certificate_signed_by_custodian)))

; [securities:beneficiary_certificate_mandatory_items] 受益憑證應記載主管機關規定之事項
(assert (= beneficiary_certificate_mandatory_items
   (and includes_fund_name_and_units_and_dates
        includes_trustee_and_custodian_info
        includes_beneficiary_name
        includes_beneficiary_units
        includes_purchase_price_and_fees
        includes_management_and_custody_fee_methods
        includes_redemption_procedures_and_fees
        includes_nav_calculation_and_announcement
        includes_transfer_restrictions_and_effects
        includes_other_mandatory_items)))

; [securities:beneficiary_certificate_audit] 發行受益憑證應經簽證，準用公開發行公司股票及公司債簽證規則
(assert (= beneficiary_certificate_audit certificate_audited))

; [securities:executive_violation_affecting_business] 董事、監察人、經理人或受僱人違反法令足以影響業務正常執行
(assert (= executive_violation_affecting_business
   has_executive_violation_affecting_business))

; [securities:executive_sanction_ordered] 主管機關得命令停止一年以下執行業務或解除職務
(assert (= executive_sanction_ordered executive_sanction_executed))

; [securities:business_sanctions] 主管機關對違法事業得為警告、解除職務、停止募集、停業、廢止許可等處分
(assert (= business_sanctions business_sanctions_executed))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反虛偽、詐欺、誤信、財報虛偽或資金運用規定，或違反保證擔保禁止，或未依規定發行受益憑證，或高階人員違法影響業務且未受處分時處罰
(assert (= penalty
   (or (not falsehood_prohibited)
       (not beneficiary_certificate_issuance)
       (not beneficiary_certificate_mandatory_items)
       (not misleading_prohibited)
       (and executive_violation_affecting_business
            (not executive_sanction_ordered)
            (not business_sanctions))
       (not fraud_prohibited)
       (not capital_use_compliance)
       (not financial_report_truthful)
       (not beneficiary_certificate_audit)
       (not guarantee_and_pledge_prohibition))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= has_falsehood true))
(assert (= falsehood_prohibited false))
(assert (= financial_report_false_or_hidden true))
(assert (= financial_report_truthful false))
(assert (= has_fraud false))
(assert (= fraud_prohibited true))
(assert (= has_misleading false))
(assert (= misleading_prohibited true))
(assert (= no_loan_to_others false))
(assert (= no_purchase_non_operating_real_estate true))
(assert (= no_other_non_business_use true))
(assert (= use_bank_deposits false))
(assert (= use_government_bonds false))
(assert (= use_treasury_bills_or_commercial_papers false))
(assert (= use_approved_securities_investment_trust_fund false))
(assert (= use_other_approved_uses false))
(assert (= capital_use_compliance false))
(assert (= complies_company_law_16_1 false))
(assert (= approved_by_authority false))
(assert (= guarantee_and_pledge_prohibition false))
(assert (= certificate_format_compliant true))
(assert (= certificate_signed_by_custodian true))
(assert (= beneficiary_certificate_issuance true))
(assert (= includes_fund_name_and_units_and_dates true))
(assert (= includes_trustee_and_custodian_info true))
(assert (= includes_beneficiary_name true))
(assert (= includes_beneficiary_units true))
(assert (= includes_purchase_price_and_fees true))
(assert (= includes_management_and_custody_fee_methods true))
(assert (= includes_redemption_procedures_and_fees true))
(assert (= includes_nav_calculation_and_announcement true))
(assert (= includes_transfer_restrictions_and_effects true))
(assert (= includes_other_mandatory_items true))
(assert (= beneficiary_certificate_mandatory_items true))
(assert (= certificate_audited true))
(assert (= beneficiary_certificate_audit true))
(assert (= has_executive_violation_affecting_business true))
(assert (= executive_violation_affecting_business true))
(assert (= executive_sanction_executed false))
(assert (= executive_sanction_ordered false))
(assert (= business_sanctions_executed true))
(assert (= business_sanctions true))
(assert (= compensation_responsibility true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 44
; Total facts: 44
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
