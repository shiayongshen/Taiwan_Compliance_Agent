; SMT2 file generated from compliance case automatic
; Case ID: case_176
; Generated at: 2025-10-19T09:53:04.285988
;
; This file can be executed with Z3:
;   z3 case_176.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_procedures_established Bool)
(declare-const compliance_with_internal_control_requirement Bool)
(declare-const control_procedures_established Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const designated_non_financial_business Bool)
(declare-const financial_institution Bool)
(declare-const inspection_cooperation Bool)
(declare-const inspection_obstruction Bool)
(declare-const institution_type Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const non_financial_type Bool)
(declare-const other_designated_matters_complied Bool)
(declare-const penalty Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const training_held_regularly Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:internal_control_established] 建立洗錢防制內部控制與稽核制度
(assert (= internal_control_established
   (and control_procedures_established
        training_held_regularly
        dedicated_personnel_assigned
        risk_assessment_report_updated
        audit_procedures_established
        other_designated_matters_complied)))

; [aml:control_procedures_established] 防制洗錢及打擊資恐之作業及控制程序已建立
(assert control_procedures_established)

; [aml:training_held_regularly] 定期舉辦或參加防制洗錢之在職訓練
(assert training_held_regularly)

; [aml:dedicated_personnel_assigned] 指派專責人員負責協調監督防制洗錢作業及控制程序執行
(assert dedicated_personnel_assigned)

; [aml:risk_assessment_report_updated] 備置並定期更新防制洗錢及打擊資恐風險評估報告
(assert risk_assessment_report_updated)

; [aml:audit_procedures_established] 建立稽核程序
(assert audit_procedures_established)

; [aml:other_designated_matters_complied] 遵守其他經中央目的事業主管機關指定之事項
(assert other_designated_matters_complied)

; [aml:internal_control_compliance] 洗錢防制內部控制與稽核制度完整且符合規定
(assert (= internal_control_compliance internal_control_established))

; [aml:inspection_cooperation] 配合中央目的事業主管機關查核，不規避、拒絕或妨礙查核
(assert (not (= inspection_obstruction inspection_cooperation)))

; [aml:financial_institution] 為金融機構
(assert (= financial_institution institution_type))

; [aml:designated_non_financial_business] 為指定之非金融事業或人員
(assert (= designated_non_financial_business non_financial_type))

; [aml:compliance_with_internal_control_requirement] 金融機構及指定非金融事業或人員依洗錢防制法第7條建立並執行內部控制制度
(assert (= compliance_with_internal_control_requirement
   (and (or financial_institution designated_non_financial_business)
        internal_control_established)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立制度或妨礙查核時處罰
(assert (= penalty
   (or (and (or financial_institution designated_non_financial_business)
            (not internal_control_established))
       inspection_obstruction)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedures_established false))
(assert (= training_held_regularly false))
(assert (= dedicated_personnel_assigned false))
(assert (= risk_assessment_report_updated false))
(assert (= audit_procedures_established false))
(assert (= other_designated_matters_complied false))
(assert (= internal_control_established false))
(assert (= inspection_obstruction false))
(assert (= inspection_cooperation true))
(assert (= financial_institution true))
(assert (= designated_non_financial_business false))
(assert (= penalty true))
(assert (= institution_type true))
(assert (= non_financial_type false))
(assert (= compliance_with_internal_control_requirement false))
(assert (= internal_control_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 16
; Total facts: 16
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
