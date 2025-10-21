; SMT2 file generated from compliance case automatic
; Case ID: case_195
; Generated at: 2025-10-21T04:16:23.983668
;
; This file can be executed with Z3:
;   z3 case_195.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_procedures_established Bool)
(declare-const bank_internal_control_compliance Bool)
(declare-const bank_internal_control_established Bool)
(declare-const bank_internal_control_executed Bool)
(declare-const bank_internal_handling_compliance Bool)
(declare-const bank_internal_handling_established Bool)
(declare-const bank_internal_handling_executed Bool)
(declare-const bank_internal_operation_compliance Bool)
(declare-const bank_internal_operation_established Bool)
(declare-const bank_internal_operation_executed Bool)
(declare-const bank_internal_systems_compliance Bool)
(declare-const control_procedures_established Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const high_risk_country Bool)
(declare-const high_risk_measures_strengthened Bool)
(declare-const high_risk_other_measures Bool)
(declare-const high_risk_transactions_restricted Bool)
(declare-const inspection_cooperation Bool)
(declare-const inspection_obstruction Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const international_organization_announced_noncompliance Bool)
(declare-const international_organization_announced_serious_deficiency Bool)
(declare-const other_concrete_evidence_high_risk Bool)
(declare-const other_designated_matters_established Bool)
(declare-const penalty Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const training_held Bool)
(declare-const violation_internal_systems Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:internal_control_established] 建立洗錢防制內部控制與稽核制度
(assert (= internal_control_established
   (and control_procedures_established
        training_held
        dedicated_personnel_assigned
        risk_assessment_report_updated
        audit_procedures_established
        other_designated_matters_established)))

; [aml:control_procedures_established] 防制洗錢及打擊資恐之作業及控制程序已建立
(assert true)

; [aml:training_held] 定期舉辦或參加防制洗錢之在職訓練
(assert true)

; [aml:dedicated_personnel_assigned] 指派專責人員負責協調監督防制洗錢事項執行
(assert true)

; [aml:risk_assessment_report_updated] 備置並定期更新防制洗錢及打擊資恐風險評估報告
(assert true)

; [aml:audit_procedures_established] 建立稽核程序
(assert true)

; [aml:other_designated_matters_established] 建立其他經中央目的事業主管機關指定之事項
(assert true)

; [aml:internal_control_executed] 洗錢防制內部控制與稽核制度確實執行
(assert true)

; [aml:internal_control_compliance] 洗錢防制內部控制與稽核制度建立且確實執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [aml:inspection_cooperation] 配合中央目的事業主管機關查核，不規避、拒絕或妨礙查核
(assert (not (= inspection_obstruction inspection_cooperation)))

; [aml:inspection_obstruction] 規避、拒絕或妨礙現地或非現地查核
(assert true)

; [aml:high_risk_country] 洗錢或資恐高風險國家或地區
(assert (= high_risk_country
   (or international_organization_announced_noncompliance
       international_organization_announced_serious_deficiency
       other_concrete_evidence_high_risk)))

; [aml:high_risk_measures_strengthened] 對洗錢或資恐高風險國家或地區強化相關交易之確認客戶身分措施
(assert true)

; [aml:high_risk_transactions_restricted] 限制或禁止與洗錢或資恐高風險國家或地區為匯款或其他交易
(assert true)

; [aml:high_risk_other_measures] 採取其他與風險相當且有效之必要防制措施
(assert true)

; [bank:internal_control_established] 銀行建立內部控制及稽核制度
(assert true)

; [bank:internal_handling_established] 銀行建立內部處理制度及程序
(assert true)

; [bank:internal_operation_established] 銀行建立內部作業制度及程序
(assert true)

; [bank:internal_control_executed] 銀行內部控制及稽核制度確實執行
(assert true)

; [bank:internal_handling_executed] 銀行內部處理制度及程序確實執行
(assert true)

; [bank:internal_operation_executed] 銀行內部作業制度及程序確實執行
(assert true)

; [bank:internal_control_compliance] 銀行建立且確實執行內部控制及稽核制度
(assert (= bank_internal_control_compliance
   (and bank_internal_control_established bank_internal_control_executed)))

; [bank:internal_handling_compliance] 銀行建立且確實執行內部處理制度及程序
(assert (= bank_internal_handling_compliance
   (and bank_internal_handling_established bank_internal_handling_executed)))

; [bank:internal_operation_compliance] 銀行建立且確實執行內部作業制度及程序
(assert (= bank_internal_operation_compliance
   (and bank_internal_operation_established bank_internal_operation_executed)))

; [bank:internal_systems_compliance] 銀行內部控制、處理及作業制度均建立且確實執行
(assert (= bank_internal_systems_compliance
   (and bank_internal_control_compliance
        bank_internal_handling_compliance
        bank_internal_operation_compliance)))

; [bank:violation_internal_systems] 未依規定建立或確實執行內部控制、處理或作業制度
(assert (not (= bank_internal_systems_compliance violation_internal_systems)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反洗錢防制法第7條規定或妨礙查核，或銀行法第129條第七款未建立或確實執行內部制度時處罰
(assert (= penalty
   (or (not internal_control_compliance)
       violation_internal_systems
       (not inspection_cooperation))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedures_established false))
(assert (= training_held false))
(assert (= dedicated_personnel_assigned false))
(assert (= risk_assessment_report_updated false))
(assert (= audit_procedures_established false))
(assert (= other_designated_matters_established false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_compliance false))
(assert (= inspection_obstruction false))
(assert (= inspection_cooperation true))
(assert (= bank_internal_control_established false))
(assert (= bank_internal_control_executed false))
(assert (= bank_internal_control_compliance false))
(assert (= bank_internal_handling_established false))
(assert (= bank_internal_handling_executed false))
(assert (= bank_internal_handling_compliance false))
(assert (= bank_internal_operation_established false))
(assert (= bank_internal_operation_executed false))
(assert (= bank_internal_operation_compliance false))
(assert (= bank_internal_systems_compliance false))
(assert (= violation_internal_systems true))
(assert (= penalty true))
(assert (= high_risk_country false))
(assert (= high_risk_measures_strengthened false))
(assert (= high_risk_transactions_restricted false))
(assert (= high_risk_other_measures false))
(assert (= international_organization_announced_noncompliance false))
(assert (= international_organization_announced_serious_deficiency false))
(assert (= other_concrete_evidence_high_risk false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 28
; Total variables: 30
; Total facts: 30
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
