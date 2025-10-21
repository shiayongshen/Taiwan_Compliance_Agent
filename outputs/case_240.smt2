; SMT2 file generated from compliance case automatic
; Case ID: case_240
; Generated at: 2025-10-21T22:02:56.734098
;
; This file can be executed with Z3:
;   z3 case_240.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const board_compliance_with_article4 Bool)
(declare-const capital_percentage Real)
(declare-const company_dissolved_and_liquidated Bool)
(declare-const controlled_shareholding Bool)
(declare-const correction_and_improvement_ordered Bool)
(declare-const correction_ordered Bool)
(declare-const direct_or_indirect_board_majority Bool)
(declare-const dispose_shares_and_dissolve Bool)
(declare-const dispose_subsidiary_shares Bool)
(declare-const established_under_fhc_law Bool)
(declare-const external_financial_reporting_compliance Bool)
(declare-const fhc_or_subsidiary_share_percentage Real)
(declare-const financial_holding_company Bool)
(declare-const financial_institution Bool)
(declare-const gaap_compliance Bool)
(declare-const has_violation Bool)
(declare-const internal_control_objectives_met Bool)
(declare-const is_bank Bool)
(declare-const is_bank_subsidiary Bool)
(declare-const is_insurance_company Bool)
(declare-const is_insurance_subsidiary Bool)
(declare-const is_other_subsidiary Bool)
(declare-const is_securities_firm Bool)
(declare-const is_securities_subsidiary Bool)
(declare-const legal_and_regulatory_compliance Bool)
(declare-const major_shareholder Bool)
(declare-const moe_notification_done Bool)
(declare-const name_change_completed Bool)
(declare-const natural_person_and_spouse_and_minor_children_share_percentage Real)
(declare-const notify_moe_on_removal Bool)
(declare-const operational_effectiveness_and_efficiency Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const penalty_measures_taken Bool)
(declare-const proper_transaction_approval Bool)
(declare-const remove_manager_or_staff Bool)
(declare-const remove_or_suspend_director_supervisor Bool)
(declare-const reporting_reliability_and_compliance Bool)
(declare-const revoke_permit Bool)
(declare-const revoke_statutory_resolution Bool)
(declare-const shares_disposed_within_deadline Bool)
(declare-const subsidiary Bool)
(declare-const suspend_subsidiary_business Bool)
(declare-const violation_occurred Bool)
(declare-const voting_shares_percentage Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:has_violation] 金融控股公司有違反法令、章程或有礙健全經營之虞
(assert (= has_violation violation_occurred))

; [fhc:correction_ordered] 主管機關已予以糾正並限期改善
(assert (= correction_ordered correction_and_improvement_ordered))

; [fhc:penalty_measures] 主管機關依情節輕重採取處分措施
(assert (= penalty_measures_taken
   (or dispose_subsidiary_shares
       revoke_permit
       other_necessary_measures
       suspend_subsidiary_business
       remove_or_suspend_director_supervisor
       remove_manager_or_staff
       revoke_statutory_resolution)))

; [fhc:notify_moe_on_removal] 依第四款解除董事、監察人職務時通知經濟部廢止登記
(assert (= notify_moe_on_removal
   (or moe_notification_done (not remove_or_suspend_director_supervisor))))

; [fhc:dispose_shares_and_dissolve] 廢止許可時限期內處分股份及董事人數不符規定，未完成則解散清算
(assert (= dispose_shares_and_dissolve
   (or (not revoke_permit)
       (not board_compliance_with_article4)
       (not shares_disposed_within_deadline)
       (not name_change_completed)
       (not company_dissolved_and_liquidated))))

; [fhc:internal_control_objectives_met] 內部控制達成營運效果及效率、報導可靠性及法令遵循目標
(assert (= internal_control_objectives_met
   (and operational_effectiveness_and_efficiency
        reporting_reliability_and_compliance
        legal_and_regulatory_compliance)))

; [fhc:external_financial_reporting_compliance] 外部財務報導符合一般公認會計原則及交易適當核准
(assert (= external_financial_reporting_compliance
   (and gaap_compliance proper_transaction_approval)))

; [fhc:definitions_controlled_shareholding] 控制性持股定義
(assert (= controlled_shareholding
   (or (not (<= voting_shares_percentage 25.0))
       direct_or_indirect_board_majority
       (not (<= capital_percentage 25.0)))))

; [fhc:definitions_fhc] 金融控股公司定義
(assert (= financial_holding_company
   (and controlled_shareholding established_under_fhc_law)))

; [fhc:definitions_financial_institution] 金融機構定義
(assert (= financial_institution (or is_bank is_insurance_company is_securities_firm)))

; [fhc:definitions_subsidiary] 子公司定義
(assert (= subsidiary
   (or is_securities_subsidiary
       is_other_subsidiary
       is_insurance_subsidiary
       is_bank_subsidiary)))

; [fhc:definitions_major_shareholder] 大股東定義
(assert (= major_shareholder
   (or (<= 5.0 fhc_or_subsidiary_share_percentage)
       (<= 5.0 natural_person_and_spouse_and_minor_children_share_percentage))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：有違反且未依規定採取處分措施時處罰
(assert (= penalty (and has_violation (not penalty_measures_taken))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_occurred true))
(assert (= has_violation true))
(assert (= correction_and_improvement_ordered false))
(assert (= correction_ordered false))
(assert (= penalty_measures_taken true))
(assert (= remove_or_suspend_director_supervisor true))
(assert (= notify_moe_on_removal false))
(assert (= moe_notification_done false))
(assert (= revoke_permit false))
(assert (= dispose_subsidiary_shares false))
(assert (= dispose_shares_and_dissolve false))
(assert (= board_compliance_with_article4 false))
(assert (= internal_control_objectives_met false))
(assert (= operational_effectiveness_and_efficiency false))
(assert (= reporting_reliability_and_compliance false))
(assert (= legal_and_regulatory_compliance false))
(assert (= external_financial_reporting_compliance false))
(assert (= gaap_compliance false))
(assert (= proper_transaction_approval false))
(assert (= remove_manager_or_staff false))
(assert (= revoke_statutory_resolution false))
(assert (= suspend_subsidiary_business false))
(assert (= other_necessary_measures false))
(assert (= financial_holding_company true))
(assert (= controlled_shareholding true))
(assert (= established_under_fhc_law true))
(assert (= subsidiary true))
(assert (= is_bank false))
(assert (= is_insurance_company false))
(assert (= is_securities_firm false))
(assert (= is_bank_subsidiary false))
(assert (= is_insurance_subsidiary false))
(assert (= is_securities_subsidiary false))
(assert (= is_other_subsidiary true))
(assert (= major_shareholder true))
(assert (= fhc_or_subsidiary_share_percentage 30.0))
(assert (= natural_person_and_spouse_and_minor_children_share_percentage 0.0))
(assert (= voting_shares_percentage 30.0))
(assert (= capital_percentage 30.0))
(assert (= company_dissolved_and_liquidated false))
(assert (= name_change_completed false))
(assert (= shares_disposed_within_deadline false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 45
; Total facts: 42
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
