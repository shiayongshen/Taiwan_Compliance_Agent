; SMT2 file generated from compliance case automatic
; Case ID: case_350
; Generated at: 2025-10-19T13:46:49.304458
;
; This file can be executed with Z3:
;   z3 case_350.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adjustments_per_reporting_manual Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const capital_first_non_restrictive Real)
(declare-const capital_first_restrictive Real)
(declare-const capital_second Real)
(declare-const capital_surplus Real)
(declare-const common_stock Real)
(declare-const convertible_subordinated_bonds_5_to_10_years Real)
(declare-const cumulative_or_interest_preferred_stock Real)
(declare-const cumulative_or_interest_subordinated_bonds Real)
(declare-const explanation_doc_false Bool)
(declare-const explanation_doc_not_according_to_rule Bool)
(declare-const internal_control_and_audit_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const investment_property_fair_value_adjustments Real)
(declare-const non_cumulative_no_interest_preferred_stock Real)
(declare-const non_cumulative_no_interest_subordinated_bonds Real)
(declare-const not_provide_explanation_doc Bool)
(declare-const not_public_explanation Bool)
(declare-const not_report_to_authority_in_time Bool)
(declare-const other_comprehensive_income Real)
(declare-const penalty Bool)
(declare-const report_or_explanation_false Bool)
(declare-const retained_earnings Real)
(declare-const special_reserves_and_surplus_per_ifrs Real)
(declare-const subordinated_bonds_over_10_years Real)
(declare-const violate_148_1_1_or_2 Bool)
(declare-const violate_148_1_1_or_2_flag Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violate_148_1_1_or_2] 違反保險法第148條之一第一項或第二項規定
(assert (= violate_148_1_1_or_2 violate_148_1_1_or_2_flag))

; [insurance:violate_148_2_1] 違反保險法第148條之二第一項規定：未提供說明文件、文件未依規定記載或記載不實
(assert (= violate_148_2_1
   (or not_provide_explanation_doc
       explanation_doc_not_according_to_rule
       explanation_doc_false)))

; [insurance:violate_148_2_2] 違反保險法第148條之二第二項規定：未依限報告或公開說明，或報告內容不實
(assert (= violate_148_2_2
   (or not_report_to_authority_in_time
       report_or_explanation_false
       not_public_explanation)))

; [insurance:violate_148_3_1] 違反保險法第148條之三第一項規定：未建立或未執行內部控制或稽核制度
(assert (= violate_148_3_1
   (or (not audit_system_established)
       (not internal_control_executed)
       (not internal_control_established)
       (not audit_system_executed))))

; [insurance:violate_148_3_2] 違反保險法第148條之三第二項規定：未建立或未執行內部處理制度或程序
(assert (= violate_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:internal_control_and_audit_ok] 已建立且執行內部控制及稽核制度
(assert (= internal_control_and_audit_ok
   (and internal_control_established
        internal_control_executed
        audit_system_established
        audit_system_executed)))

; [insurance:internal_handling_ok] 已建立且執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:capital_category_first_non_restrictive] 第一類非限制性資本範圍合計
(assert (= capital_first_non_restrictive
   (+ common_stock
      capital_surplus
      retained_earnings
      other_comprehensive_income
      (ite adjustments_per_reporting_manual 1.0 0.0))))

; [insurance:capital_category_first_restrictive] 第一類限制性資本範圍合計
(assert (= capital_first_restrictive
   (+ non_cumulative_no_interest_preferred_stock
      non_cumulative_no_interest_subordinated_bonds
      (ite adjustments_per_reporting_manual 1.0 0.0))))

; [insurance:capital_category_second] 第二類資本範圍合計
(assert (= capital_second
   (+ cumulative_or_interest_preferred_stock
      cumulative_or_interest_subordinated_bonds
      subordinated_bonds_over_10_years
      convertible_subordinated_bonds_5_to_10_years
      special_reserves_and_surplus_per_ifrs
      investment_property_fair_value_adjustments
      (ite adjustments_per_reporting_manual 1.0 0.0))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一相關規定時處罰
(assert (= penalty
   (or violate_148_1_1_or_2
       violate_148_2_1
       violate_148_2_2
       violate_148_3_1
       violate_148_3_2)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_148_1_1_or_2_flag false))
(assert (= not_provide_explanation_doc false))
(assert (= explanation_doc_not_according_to_rule false))
(assert (= explanation_doc_false false))
(assert (= not_report_to_authority_in_time false))
(assert (= not_public_explanation false))
(assert (= report_or_explanation_false false))
(assert (= internal_control_established true))
(assert (= internal_control_executed true))
(assert (= audit_system_established true))
(assert (= audit_system_executed true))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed true))
(assert (= adjustments_per_reporting_manual false))
(assert (= common_stock 0.0))
(assert (= capital_surplus 0.0))
(assert (= retained_earnings 0.0))
(assert (= other_comprehensive_income 0.0))
(assert (= non_cumulative_no_interest_preferred_stock 0.0))
(assert (= non_cumulative_no_interest_subordinated_bonds 0.0))
(assert (= cumulative_or_interest_preferred_stock 0.0))
(assert (= cumulative_or_interest_subordinated_bonds 0.0))
(assert (= subordinated_bonds_over_10_years 0.0))
(assert (= convertible_subordinated_bonds_5_to_10_years 0.0))
(assert (= special_reserves_and_surplus_per_ifrs 0.0))
(assert (= investment_property_fair_value_adjustments 0.0))
(assert (= violate_148_3_2 true))
(assert (= violate_148_3_1 false))
(assert (= violate_148_2_1 false))
(assert (= violate_148_2_2 false))
(assert (= violate_148_1_1_or_2 false))
(assert (= penalty true))
(assert (= capital_first_non_restrictive 0.0))
(assert (= capital_first_restrictive 0.0))
(assert (= capital_second 0.0))
(assert (= internal_control_and_audit_ok false))
(assert (= internal_handling_ok false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 37
; Total facts: 37
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
