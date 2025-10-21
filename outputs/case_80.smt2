; SMT2 file generated from compliance case automatic
; Case ID: case_80
; Generated at: 2025-10-21T01:00:49.629872
;
; This file can be executed with Z3:
;   z3 case_80.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const advertising_clear_disclaimer Bool)
(declare-const advertising_compliance Bool)
(declare-const advertising_content_truthful Bool)
(declare-const advertising_ethics_compliance Bool)
(declare-const advertising_no_exaggeration Bool)
(declare-const advertising_no_false_reports Bool)
(declare-const advertising_no_guarantee_of_principal_or_profit Bool)
(declare-const advertising_no_misleading Bool)
(declare-const advertising_no_misleading_government_approval Bool)
(declare-const advertising_no_promotion_of_unapproved_products Bool)
(declare-const advertising_no_reputation_damage Bool)
(declare-const advertising_no_trademark_misuse Bool)
(declare-const article_163_5_complied Bool)
(declare-const article_165_1_complied Bool)
(declare-const assist_formal_condition_violation Bool)
(declare-const audit_committee_approval_ratio Real)
(declare-const audit_committee_approval_reported_to_board Bool)
(declare-const audit_committee_exists Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const board_member_has_reservation_or_opposition Bool)
(declare-const business_management_rule_complied Bool)
(declare-const compliance_system_established Bool)
(declare-const compliance_system_executed Bool)
(declare-const consumer_info_compliance Bool)
(declare-const disclosure_compliance Bool)
(declare-const financial_management_rule_complied Bool)
(declare-const formal_condition_compliance Bool)
(declare-const internal_audit_system_established Bool)
(declare-const internal_audit_system_executed Bool)
(declare-const internal_control_approved Bool)
(declare-const internal_control_approved_by_board Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_measures_executed Bool)
(declare-const internal_control_opinion_recorded Bool)
(declare-const internal_control_reported Bool)
(declare-const internal_control_reported_to_supervisors_or_audit_committee Bool)
(declare-const internal_control_three_lines Bool)
(declare-const major_violation Bool)
(declare-const management_rule_compliance Bool)
(declare-const penalty Bool)
(declare-const remuneration_compliance Bool)
(declare-const remuneration_system_established Bool)
(declare-const remuneration_system_executed Bool)
(declare-const reservation_opposition_recorded Bool)
(declare-const risk_management_system_established Bool)
(declare-const risk_management_system_executed Bool)
(declare-const self_audit_system_established Bool)
(declare-const self_audit_system_executed Bool)
(declare-const solicitation_handling_system_established Bool)
(declare-const solicitation_handling_system_executed Bool)
(declare-const violate_advertising_regulations Bool)
(declare-const violate_consumer_info_regulations Bool)
(declare-const violate_disclosure_regulations Bool)
(declare-const violation_is_major Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:internal_control_compliance] 建立且確實執行內部控制、稽核制度、招攬處理制度及程序
(assert (= internal_control_compliance
   (and internal_control_established
        internal_control_executed
        audit_system_established
        audit_system_executed
        solicitation_handling_system_established
        solicitation_handling_system_executed)))

; [insurance:management_rule_compliance] 遵守財務或業務管理相關管理規則及相關規定
(assert (= management_rule_compliance
   (and financial_management_rule_complied
        business_management_rule_complied
        article_165_1_complied
        article_163_5_complied)))

; [finance_consumer:advertising_compliance] 遵守廣告、業務招攬及營業促銷活動相關規定
(assert (not (= violate_advertising_regulations advertising_compliance)))

; [finance_consumer:consumer_info_compliance] 充分瞭解金融消費者資料並確保適合度
(assert (not (= violate_consumer_info_regulations consumer_info_compliance)))

; [finance_consumer:disclosure_compliance] 充分說明金融商品、服務及揭露風險
(assert (not (= violate_disclosure_regulations disclosure_compliance)))

; [finance_consumer:remuneration_compliance] 訂定酬金制度且確實執行
(assert (= remuneration_compliance
   (and remuneration_system_established remuneration_system_executed)))

; [finance_consumer:formal_condition_compliance] 未協助自然人或法人創造不符第四條第二項條件之形式外觀
(assert (not (= assist_formal_condition_violation formal_condition_compliance)))

; [finance_consumer:major_violation] 情節重大違反前述規定
(assert (= major_violation violation_is_major))

; [insurance:internal_control_approved] 內部控制、稽核制度及招攬處理制度經董（理）事會通過
(assert (let ((a!1 (and internal_control_approved_by_board
                (or (not audit_committee_exists)
                    (and (<= (/ 1.0 2.0) audit_committee_approval_ratio)
                         audit_committee_approval_reported_to_board)))))
  (= internal_control_approved a!1)))

; [insurance:internal_control_opinion_recorded] 董（理）事保留或反對意見已記錄於會議紀錄
(assert (= internal_control_opinion_recorded
   (or reservation_opposition_recorded
       (not board_member_has_reservation_or_opposition))))

; [insurance:internal_control_reported] 內部控制、稽核制度及招攬處理制度送監察人或審計委員會
(assert (= internal_control_reported
   internal_control_reported_to_supervisors_or_audit_committee))

; [insurance:internal_control_three_lines] 建立內部控制三道防線及相關制度
(assert (= internal_control_three_lines
   (and self_audit_system_established
        compliance_system_established
        risk_management_system_established
        internal_audit_system_established)))

; [insurance:internal_control_measures_executed] 內部控制三道防線措施確實執行
(assert (= internal_control_measures_executed
   (and self_audit_system_executed
        compliance_system_executed
        risk_management_system_executed
        internal_audit_system_executed)))

; [finance_consumer:advertising_ethics_compliance] 廣告、業務招攬及營業促銷活動符合社會道德、誠實信用及保護消費者精神
(assert (= advertising_ethics_compliance
   (and advertising_content_truthful
        advertising_no_misleading
        advertising_no_reputation_damage
        advertising_no_trademark_misuse
        advertising_no_false_reports
        advertising_no_exaggeration
        advertising_no_misleading_government_approval
        advertising_no_promotion_of_unapproved_products
        advertising_no_guarantee_of_principal_or_profit
        advertising_clear_disclaimer)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制、稽核、招攬處理制度或管理規則，或違反金融消費者保護相關規定時處罰
(assert (= penalty
   (or (not advertising_compliance)
       (not management_rule_compliance)
       (not internal_control_measures_executed)
       (not formal_condition_compliance)
       (not advertising_ethics_compliance)
       (not internal_control_approved)
       (not disclosure_compliance)
       (not remuneration_compliance)
       (not consumer_info_compliance)
       (not internal_control_compliance)
       major_violation)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established true))
(assert (= internal_control_executed false))
(assert (= audit_system_established true))
(assert (= audit_system_executed false))
(assert (= solicitation_handling_system_established true))
(assert (= solicitation_handling_system_executed false))
(assert (= internal_control_compliance false))
(assert (= financial_management_rule_complied false))
(assert (= business_management_rule_complied true))
(assert (= article_165_1_complied true))
(assert (= article_163_5_complied true))
(assert (= management_rule_compliance false))
(assert (= violate_advertising_regulations true))
(assert (= advertising_compliance false))
(assert (= violate_consumer_info_regulations true))
(assert (= consumer_info_compliance false))
(assert (= violate_disclosure_regulations true))
(assert (= disclosure_compliance false))
(assert (= remuneration_system_established true))
(assert (= remuneration_system_executed true))
(assert (= remuneration_compliance true))
(assert (= assist_formal_condition_violation false))
(assert (= formal_condition_compliance true))
(assert (= violation_is_major true))
(assert (= major_violation true))
(assert (= internal_control_approved_by_board false))
(assert (= internal_control_approved false))
(assert (= self_audit_system_established true))
(assert (= compliance_system_established true))
(assert (= risk_management_system_established true))
(assert (= internal_audit_system_established true))
(assert (= internal_control_three_lines true))
(assert (= self_audit_system_executed false))
(assert (= compliance_system_executed false))
(assert (= risk_management_system_executed false))
(assert (= internal_audit_system_executed false))
(assert (= internal_control_measures_executed false))
(assert (= advertising_content_truthful false))
(assert (= advertising_no_misleading false))
(assert (= advertising_no_reputation_damage true))
(assert (= advertising_no_trademark_misuse true))
(assert (= advertising_no_false_reports false))
(assert (= advertising_no_exaggeration false))
(assert (= advertising_no_misleading_government_approval true))
(assert (= advertising_no_promotion_of_unapproved_products false))
(assert (= advertising_no_guarantee_of_principal_or_profit false))
(assert (= advertising_clear_disclaimer false))
(assert (= advertising_ethics_compliance false))
(assert (= board_member_has_reservation_or_opposition false))
(assert (= reservation_opposition_recorded false))
(assert (= internal_control_reported_to_supervisors_or_audit_committee false))
(assert (= internal_control_reported false))
(assert (= audit_committee_exists false))
(assert (= audit_committee_approval_ratio 0.0))
(assert (= audit_committee_approval_reported_to_board false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 57
; Total facts: 56
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
