; SMT2 file generated from compliance case automatic
; Case ID: case_220
; Generated at: 2025-10-21T04:53:24.686467
;
; This file can be executed with Z3:
;   z3 case_220.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const advertising_violation Bool)
(declare-const assist_formal_condition_violation Bool)
(declare-const audit_procedure Bool)
(declare-const beneficiary_transfer_limit_disclosed Bool)
(declare-const consumer_info_violation Bool)
(declare-const contract_disclosure_compliance Bool)
(declare-const control_content_compliance Bool)
(declare-const control_content_not_compliant Bool)
(declare-const control_established Bool)
(declare-const control_executed Bool)
(declare-const control_not_established Bool)
(declare-const control_not_executed Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const disclosure_violation Bool)
(declare-const fail_required_action Bool)
(declare-const formal_condition_violation Bool)
(declare-const inspection_obstructed Bool)
(declare-const inspection_obstruction_penalty Bool)
(declare-const internal_control_compliance Bool)
(declare-const major_violation_penalty Bool)
(declare-const operation_scope_disclosed Bool)
(declare-const other_designated_matters Bool)
(declare-const penalty Bool)
(declare-const periodic_inspection_done Bool)
(declare-const procedure_anti_money_laundering Bool)
(declare-const regular_training Bool)
(declare-const regulator_periodic_inspection Bool)
(declare-const remuneration_violation Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const risk_disclosure_disclosed Bool)
(declare-const trustor_informed Bool)
(declare-const violate_advertising_rules Bool)
(declare-const violate_consumer_info_rules Bool)
(declare-const violate_disclosure_rules Bool)
(declare-const violate_mandatory_prohibition Bool)
(declare-const violate_remuneration_rules Bool)
(declare-const violation_major Bool)
(declare-const violation_penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [trust:violation_penalty] 違反信託業法強制或禁止規定之處罰
(assert (= violation_penalty (or violate_mandatory_prohibition fail_required_action)))

; [trust:contract_disclosure_compliance] 信託契約載明營運範圍、受益權轉讓限制及風險揭露且告知委託人
(assert (= contract_disclosure_compliance
   (and operation_scope_disclosed
        beneficiary_transfer_limit_disclosed
        risk_disclosure_disclosed
        trustor_informed)))

; [aml:internal_control_compliance] 建立洗錢防制內部控制與稽核制度且確實執行
(assert (= internal_control_compliance (and control_established control_executed)))

; [aml:control_content_compliance] 洗錢防制制度內容符合六項規定
(assert (= control_content_compliance
   (and procedure_anti_money_laundering
        regular_training
        dedicated_personnel_assigned
        risk_assessment_report_updated
        audit_procedure
        other_designated_matters)))

; [aml:regulator_periodic_inspection] 主管機關定期查核洗錢防制制度執行情形
(assert (= regulator_periodic_inspection periodic_inspection_done))

; [aml:violation_penalty] 違反洗錢防制法未建立或未依規定執行制度之處罰
(assert (= violation_penalty
   (or control_not_executed
       control_content_not_compliant
       control_not_established)))

; [aml:inspection_obstruction_penalty] 規避、拒絕或妨礙查核之處罰
(assert (= inspection_obstruction_penalty inspection_obstructed))

; [fcp:advertising_violation] 違反金融消費者保護法第八條第二項辦法中廣告、招攬、促銷規定
(assert (= advertising_violation violate_advertising_rules))

; [fcp:consumer_info_violation] 違反第九條第一項未充分瞭解消費者資料或適合度規定
(assert (= consumer_info_violation violate_consumer_info_rules))

; [fcp:disclosure_violation] 違反第十條第一項未充分說明或揭露風險規定
(assert (= disclosure_violation violate_disclosure_rules))

; [fcp:remuneration_violation] 違反第十一條之一未訂定或未依核定原則訂定酬金制度或未確實執行
(assert (= remuneration_violation violate_remuneration_rules))

; [fcp:formal_condition_violation] 協助創造形式上外觀條件不符第四條第二項規定
(assert (= formal_condition_violation assist_formal_condition_violation))

; [fcp:major_violation_penalty] 情節重大者得加重罰鍰不受最高額限制
(assert (= major_violation_penalty violation_major))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反信託業法、洗錢防制法或金融消費者保護法相關規定時處罰
(assert (= penalty
   (or disclosure_violation
       formal_condition_violation
       inspection_obstruction_penalty
       consumer_info_violation
       violation_penalty
       advertising_violation
       remuneration_violation)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_mandatory_prohibition true))
(assert (= fail_required_action true))
(assert (= operation_scope_disclosed false))
(assert (= beneficiary_transfer_limit_disclosed false))
(assert (= risk_disclosure_disclosed false))
(assert (= trustor_informed false))
(assert (= control_established false))
(assert (= control_executed false))
(assert (= control_not_established true))
(assert (= control_not_executed true))
(assert (= procedure_anti_money_laundering false))
(assert (= regular_training false))
(assert (= dedicated_personnel_assigned false))
(assert (= risk_assessment_report_updated false))
(assert (= audit_procedure false))
(assert (= other_designated_matters false))
(assert (= periodic_inspection_done false))
(assert (= inspection_obstructed false))
(assert (= violate_advertising_rules false))
(assert (= violate_consumer_info_rules true))
(assert (= violate_disclosure_rules false))
(assert (= violate_remuneration_rules false))
(assert (= assist_formal_condition_violation false))
(assert (= violation_major false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 38
; Total facts: 24
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
