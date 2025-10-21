; SMT2 file generated from compliance case automatic
; Case ID: case_112
; Generated at: 2025-10-21T01:58:21.154434
;
; This file can be executed with Z3:
;   z3 case_112.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_rule_violation Bool)
(declare-const document_noncompliance Bool)
(declare-const improvement_completed Bool)
(declare-const internal_control_change_completed Bool)
(declare-const internal_control_change_notified Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_updated Bool)
(declare-const legal_violation Bool)
(declare-const not_comply_document_rules Bool)
(declare-const not_execute_internal_control Bool)
(declare-const not_submit_documents Bool)
(declare-const obstruct_inspection Bool)
(declare-const penalty Bool)
(declare-const penalty_fine_applicable Bool)
(declare-const refuse_inspection Bool)
(declare-const refuse_or_obstruct_inspection Bool)
(declare-const violate_article_141 Bool)
(declare-const violate_article_141_applied Bool)
(declare-const violate_article_144 Bool)
(declare-const violate_article_144_applied Bool)
(declare-const violate_article_145_2 Bool)
(declare-const violate_article_145_2_applied Bool)
(declare-const violate_article_147 Bool)
(declare-const violate_article_147_applied Bool)
(declare-const violate_article_14_1_1 Bool)
(declare-const violate_article_14_1_3 Bool)
(declare-const violate_article_14_3 Bool)
(declare-const violate_article_152 Bool)
(declare-const violate_article_159 Bool)
(declare-const violate_article_165_1 Bool)
(declare-const violate_article_165_2 Bool)
(declare-const violate_article_21_1_5 Bool)
(declare-const violate_article_58 Bool)
(declare-const violate_article_61 Bool)
(declare-const violate_article_61_applied Bool)
(declare-const violate_article_69_1 Bool)
(declare-const violate_article_79 Bool)
(declare-const violate_finance_business_management_rules Bool)
(declare-const violate_government_order Bool)
(declare-const violate_other_finance_business_management_rules Bool)
(declare-const violate_securities_law Bool)
(declare-const violation_dismiss_officer Bool)
(declare-const violation_license_revoked Bool)
(declare-const violation_minor Bool)
(declare-const violation_other_measures Bool)
(declare-const violation_penalty_level Bool)
(declare-const violation_suspension Bool)
(declare-const violation_warning Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_penalty_level] 證券商違反法令之處分等級（1=警告, 2=解除職務, 3=停業, 4=撤銷營業許可, 5=其他處置, 0=無處分）
(assert (let ((a!1 (ite violation_dismiss_officer
                2
                (ite violation_suspension
                     3
                     (ite violation_license_revoked
                          4
                          (ite violation_other_measures 5 0))))))
  (= (ite violation_penalty_level 1 0) (ite violation_warning 1 a!1))))

; [securities:internal_control_compliance] 證券商確實執行內部控制制度
(assert (= internal_control_compliance internal_control_executed))

; [securities:legal_violation] 證券商違反證券交易法或主管機關命令
(assert (= legal_violation (or violate_government_order violate_securities_law)))

; [securities:penalty_fine_applicable] 證券商或相關事業違反規定應處罰鍰
(assert (= penalty_fine_applicable
   (and (or violate_article_144
            violate_article_144_applied
            violate_article_147
            violate_article_14_1_1
            violate_article_165_1
            violate_article_145_2_applied
            violate_article_14_3
            violate_article_141
            violate_article_61
            violate_article_61_applied
            violate_article_69_1
            violate_article_159
            violate_article_79
            violate_article_145_2
            violate_article_152
            violate_article_58
            violate_article_147_applied
            violate_article_165_2
            violate_article_14_1_3
            violate_article_21_1_5
            violate_article_141_applied)
        (not violation_minor))))

; [securities:refuse_or_obstruct_inspection] 拒絕、規避或妨礙主管機關檢查
(assert (= refuse_or_obstruct_inspection
   (or not_submit_documents obstruct_inspection refuse_inspection)))

; [securities:document_noncompliance] 未依規定製作、申報、公告、備置或保存相關文件
(assert (= document_noncompliance not_comply_document_rules))

; [securities:business_rule_violation] 違反財務、業務或管理相關規定
(assert (= business_rule_violation
   (or not_execute_internal_control
       violate_finance_business_management_rules
       violate_other_finance_business_management_rules)))

; [securities:internal_control_established] 證券商依規定建立內部控制制度
(assert (= internal_control_established internal_control_system_established))

; [securities:internal_control_updated] 內部控制制度依主管機關通知變更且於限期內完成變更
(assert (= internal_control_updated
   (or internal_control_change_completed (not internal_control_change_notified))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反法令或主管機關命令且未限期改善者處罰
(assert (= penalty
   (or (and (not internal_control_compliance) (not improvement_completed))
       refuse_or_obstruct_inspection
       (and (not internal_control_established) (not improvement_completed))
       (and business_rule_violation (not improvement_completed))
       (and legal_violation (not improvement_completed))
       document_noncompliance
       (and penalty_fine_applicable (not improvement_completed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_warning true))
(assert (= violate_securities_law true))
(assert (= violate_government_order true))
(assert (= legal_violation true))
(assert (= business_rule_violation true))
(assert (= not_execute_internal_control true))
(assert (= internal_control_executed false))
(assert (= internal_control_compliance false))
(assert (= internal_control_established true))
(assert (= internal_control_system_established true))
(assert (= internal_control_change_notified false))
(assert (= internal_control_change_completed false))
(assert (= improvement_completed false))
(assert (= penalty_fine_applicable true))
(assert (= violation_minor false))
(assert (= penalty true))
(assert (= refuse_or_obstruct_inspection false))
(assert (= document_noncompliance false))
(assert (= not_comply_document_rules false))
(assert (= not_submit_documents false))
(assert (= obstruct_inspection false))
(assert (= refuse_inspection false))
(assert (= violation_dismiss_officer false))
(assert (= violation_license_revoked false))
(assert (= violation_other_measures false))
(assert (= violation_suspension false))
(assert (= violate_article_14_1_1 false))
(assert (= violate_article_14_1_3 false))
(assert (= violate_article_14_3 false))
(assert (= violate_article_21_1_5 false))
(assert (= violate_article_58 false))
(assert (= violate_article_61 false))
(assert (= violate_article_61_applied false))
(assert (= violate_article_69_1 false))
(assert (= violate_article_79 false))
(assert (= violate_article_141 false))
(assert (= violate_article_141_applied false))
(assert (= violate_article_144 false))
(assert (= violate_article_144_applied false))
(assert (= violate_article_145_2 false))
(assert (= violate_article_145_2_applied false))
(assert (= violate_article_147 false))
(assert (= violate_article_147_applied false))
(assert (= violate_article_152 false))
(assert (= violate_article_159 false))
(assert (= violate_article_165_1 false))
(assert (= violate_article_165_2 false))
(assert (= violate_finance_business_management_rules false))
(assert (= violate_other_finance_business_management_rules false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 51
; Total facts: 49
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
