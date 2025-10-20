; SMT2 file generated from compliance case automatic
; Case ID: case_112
; Generated at: 2025-10-19T08:20:05.512822
;
; This file can be executed with Z3:
;   z3 case_112.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_operated_according_to_law Bool)
(declare-const business_operated_according_to_law_flag Bool)
(declare-const failed_to_comply_document_requirements Bool)
(declare-const failed_to_submit_or_obstruct_inspection Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_control_updated_on_time Bool)
(declare-const internal_control_updated_within_deadline Bool)
(declare-const penalty Bool)
(declare-const violation_178_1_1 Bool)
(declare-const violation_178_1_2 Bool)
(declare-const violation_178_1_3 Bool)
(declare-const violation_178_1_4 Bool)
(declare-const violation_178_1_5 Bool)
(declare-const violation_178_1_6 Bool)
(declare-const violation_178_1_7 Bool)
(declare-const violation_178_1_any Bool)
(declare-const violation_178_1_improved Bool)
(declare-const violation_178_1_improvement_completed Bool)
(declare-const violation_178_1_minor Bool)
(declare-const violation_178_1_minor_flag Bool)
(declare-const violation_178_1_penalty_applicable Bool)
(declare-const violation_dismiss_officer Bool)
(declare-const violation_financial_business_management_rules Bool)
(declare-const violation_license_revocation Bool)
(declare-const violation_market_organization_rules Bool)
(declare-const violation_other_measures Bool)
(declare-const violation_penalty Bool)
(declare-const violation_securities_issuance_rules Bool)
(declare-const violation_specified_articles Bool)
(declare-const violation_suspension Bool)
(declare-const violation_warning Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_penalty] 證券商違反法令或命令之處分類型
(assert (let ((a!1 (ite violation_dismiss_officer
                2
                (ite violation_suspension
                     3
                     (ite violation_license_revocation
                          4
                          (ite violation_other_measures 5 0))))))
  (= (ite violation_penalty 1 0) (ite violation_warning 1 a!1))))

; [securities:internal_control_established] 證券商依規定訂定內部控制制度
(assert (= internal_control_established internal_control_system_established))

; [securities:internal_control_executed] 證券商確實執行內部控制制度
(assert (= internal_control_executed internal_control_system_executed))

; [securities:violation_178_1_1] 違反證券交易法指定條文之一
(assert (= violation_178_1_1 violation_specified_articles))

; [securities:violation_178_1_2] 未依主管機關命令提出帳簿文件或妨礙檢查
(assert (= violation_178_1_2 failed_to_submit_or_obstruct_inspection))

; [securities:violation_178_1_3] 未依規定製作、申報、公告、備置或保存相關文件
(assert (= violation_178_1_3 failed_to_comply_document_requirements))

; [securities:violation_178_1_4] 未確實執行內部控制制度
(assert (not (= (and internal_control_established internal_control_executed)
        violation_178_1_4)))

; [securities:violation_178_1_5] 違反財務、業務或管理相關規定
(assert (= violation_178_1_5 violation_financial_business_management_rules))

; [securities:violation_178_1_6] 違反有價證券發行及相關規定
(assert (= violation_178_1_6 violation_securities_issuance_rules))

; [securities:violation_178_1_7] 違反證券櫃檯買賣中心、同業公會或證券交易所相關規定
(assert (= violation_178_1_7 violation_market_organization_rules))

; [securities:violation_178_1_any] 違反第178-1條任一規定
(assert (= violation_178_1_any
   (or violation_178_1_1
       violation_178_1_2
       violation_178_1_3
       violation_178_1_4
       violation_178_1_5
       violation_178_1_6
       violation_178_1_7)))

; [securities:violation_178_1_minor] 違反第178-1條情節輕微
(assert (= violation_178_1_minor violation_178_1_minor_flag))

; [securities:violation_178_1_improved] 違反第178-1條已限期改善且完成
(assert (= violation_178_1_improved violation_178_1_improvement_completed))

; [securities:violation_178_1_penalty_applicable] 第178-1條違反行為應處罰
(assert (= violation_178_1_penalty_applicable
   (and violation_178_1_any
        (not (or violation_178_1_minor violation_178_1_improved)))))

; [securities:internal_control_compliance] 內部控制制度符合規定
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [securities:business_operated_according_to_law] 證券商業務依法令、章程及內部控制制度經營
(assert (= business_operated_according_to_law business_operated_according_to_law_flag))

; [securities:internal_control_updated_on_time] 內部控制制度於限期內完成變更
(assert (= internal_control_updated_on_time internal_control_updated_within_deadline))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反證券交易法第66條或第178-1條規定且未免罰或未改善完成時處罰
(assert (= penalty (or violation_178_1_penalty_applicable violation_penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_warning true))
(assert (= violation_penalty true))
(assert (= violation_specified_articles true))
(assert (= violation_178_1_1 true))
(assert (= violation_178_1_4 true))
(assert (= internal_control_system_established true))
(assert (= internal_control_system_executed false))
(assert (= internal_control_established true))
(assert (= internal_control_executed false))
(assert (= violation_178_1_any true))
(assert (= violation_178_1_minor_flag false))
(assert (= violation_178_1_minor false))
(assert (= violation_178_1_improvement_completed false))
(assert (= violation_178_1_improved false))
(assert (= penalty true))
(assert (= violation_dismiss_officer false))
(assert (= violation_suspension false))
(assert (= violation_license_revocation false))
(assert (= violation_other_measures false))
(assert (= failed_to_submit_or_obstruct_inspection false))
(assert (= failed_to_comply_document_requirements false))
(assert (= violation_financial_business_management_rules false))
(assert (= violation_securities_issuance_rules false))
(assert (= violation_market_organization_rules false))
(assert (= business_operated_according_to_law_flag false))
(assert (= business_operated_according_to_law false))
(assert (= internal_control_updated_within_deadline false))
(assert (= internal_control_updated_on_time false))
(assert (= violation_178_1_2 false))
(assert (= violation_178_1_3 false))
(assert (= internal_control_compliance false))
(assert (= violation_178_1_5 false))
(assert (= violation_178_1_6 false))
(assert (= violation_178_1_7 false))
(assert (= violation_178_1_penalty_applicable false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 19
; Total variables: 35
; Total facts: 35
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
