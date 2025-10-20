; SMT2 file generated from compliance case automatic
; Case ID: case_301
; Generated at: 2025-10-19T12:33:58.091033
;
; This file can be executed with Z3:
;   z3 case_301.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const actuary_assigned Bool)
(declare-const actuary_employed Bool)
(declare-const actuary_reports_fair_and_true Bool)
(declare-const board_approval_for_actuary Bool)
(declare-const board_approved_external_actuary Bool)
(declare-const board_approved_signing_actuary Bool)
(declare-const external_actuary_hired Bool)
(declare-const external_actuary_review_executed Bool)
(declare-const external_actuary_review_report_true Bool)
(declare-const external_actuary_reviewed Bool)
(declare-const financial_and_business_disclosure_compliance Bool)
(declare-const financial_business_documents_prepared Bool)
(declare-const insurance_product_review_compliance Bool)
(declare-const insured_amount Real)
(declare-const internal_control_established Bool)
(declare-const internal_control_established_and_executed Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_established_and_executed Bool)
(declare-const internal_handling_executed Bool)
(declare-const major_information_reported_and_disclosed Bool)
(declare-const market_value Real)
(declare-const over_insurance_prohibited Bool)
(declare-const penalty Bool)
(declare-const product_documents_submitted Bool)
(declare-const product_reviewed_per_guidelines Bool)
(declare-const reinsurance_compliance Bool)
(declare-const reinsurance_compliant Bool)
(declare-const signing_actuary_assigned Bool)
(declare-const signing_actuary_report_true Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:over_insurance_prohibited] 保險金額不得超額承保
(assert (= over_insurance_prohibited (<= insured_amount market_value)))

; [insurance:actuary_assigned] 保險業聘用精算人員並指派簽證精算人員
(assert (= actuary_assigned (and actuary_employed signing_actuary_assigned)))

; [insurance:external_actuary_reviewed] 保險業聘請外部複核精算人員並執行複核
(assert (= external_actuary_reviewed
   (and external_actuary_hired external_actuary_review_executed)))

; [insurance:board_approval_for_actuary] 董（理）事會同意簽證精算人員指派及外部複核精算人員聘請
(assert (= board_approval_for_actuary
   (and board_approved_signing_actuary board_approved_external_actuary)))

; [insurance:actuary_reports_fair_and_true] 簽證精算人員及外部複核精算人員報告不得有虛偽、隱匿、遺漏或錯誤
(assert (= actuary_reports_fair_and_true
   (and signing_actuary_report_true external_actuary_review_report_true)))

; [insurance:internal_control_established_and_executed] 保險業建立並執行內部控制及稽核制度
(assert (= internal_control_established_and_executed
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_established_and_executed] 保險業建立並執行內部處理制度及程序
(assert (= internal_handling_established_and_executed
   (and internal_handling_established internal_handling_executed)))

; [insurance:reinsurance_compliance] 保險業辦理再保險分出、分入及其他危險分散機制符合主管機關規定
(assert (= reinsurance_compliance reinsurance_compliant))

; [insurance:insurance_product_review_compliance] 保險業銷售保險商品前依規定程序辦理審查
(assert (= insurance_product_review_compliance
   (and product_reviewed_per_guidelines product_documents_submitted)))

; [insurance:financial_and_business_disclosure_compliance] 保險業依規定編製說明文件並於重大訊息發生時報告及公開說明
(assert (= financial_and_business_disclosure_compliance
   (and financial_business_documents_prepared
        major_information_reported_and_disclosed)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反超額承保、精算人員聘用、簽證報告、內部控制、內部處理、再保險規定、保險商品審查或財務業務說明文件規定時處罰
(assert (= penalty
   (or (not actuary_reports_fair_and_true)
       (not insurance_product_review_compliance)
       (not actuary_assigned)
       (not reinsurance_compliance)
       (not over_insurance_prohibited)
       (not financial_and_business_disclosure_compliance)
       (not internal_control_established_and_executed)
       (not board_approval_for_actuary)
       (not external_actuary_reviewed)
       (not internal_handling_established_and_executed))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= over_insurance_prohibited false))
(assert (= actuary_employed false))
(assert (= signing_actuary_assigned false))
(assert (= external_actuary_hired false))
(assert (= external_actuary_review_executed false))
(assert (= signing_actuary_report_true false))
(assert (= external_actuary_review_report_true false))
(assert (= board_approved_signing_actuary false))
(assert (= board_approved_external_actuary false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= reinsurance_compliant false))
(assert (= product_reviewed_per_guidelines false))
(assert (= product_documents_submitted false))
(assert (= financial_business_documents_prepared false))
(assert (= major_information_reported_and_disclosed false))
(assert (= insured_amount 1000000.0))
(assert (= market_value 500000.0))
(assert (= penalty true))
(assert (= actuary_assigned false))
(assert (= actuary_reports_fair_and_true false))
(assert (= board_approval_for_actuary false))
(assert (= external_actuary_reviewed false))
(assert (= financial_and_business_disclosure_compliance false))
(assert (= insurance_product_review_compliance false))
(assert (= internal_control_established_and_executed false))
(assert (= internal_handling_established_and_executed false))
(assert (= reinsurance_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 30
; Total facts: 30
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
