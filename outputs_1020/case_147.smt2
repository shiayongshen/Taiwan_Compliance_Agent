; SMT2 file generated from compliance case automatic
; Case ID: case_147
; Generated at: 2025-10-19T09:18:08.129614
;
; This file can be executed with Z3:
;   z3 case_147.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_broker_officer_violation Bool)
(declare-const assist_create_formal_appearance Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const correction_made_167_2 Bool)
(declare-const correction_made_167_3 Bool)
(declare-const dismissal_of_manager_or_staff Bool)
(declare-const dismissal_or_suspension_of_director_or_supervisor Bool)
(declare-const fine_imposed_167_2 Bool)
(declare-const fine_imposed_167_3 Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const license_revoked Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const penalty_167_2 Bool)
(declare-const penalty_167_3 Bool)
(declare-const penalty_30_1 Bool)
(declare-const penalty_measures Bool)
(declare-const restriction_of_business_scope Bool)
(declare-const solicitation_handling_system_established Bool)
(declare-const solicitation_handling_system_executed Bool)
(declare-const violate_163_5_applied Bool)
(declare-const violate_163_7 Bool)
(declare-const violate_165_1 Bool)
(declare-const violate_advertising_or_promotion_rules Bool)
(declare-const violate_compensation_system_rules Bool)
(declare-const violate_consumer_data_or_suitability_rules Bool)
(declare-const violate_disclosure_or_explanation_rules Bool)
(declare-const violate_financial_or_business_management_rules Bool)
(declare-const violation_167_2 Bool)
(declare-const violation_167_3 Bool)
(declare-const violation_30_1_1 Bool)
(declare-const violation_30_1_2 Bool)
(declare-const violation_30_1_3 Bool)
(declare-const violation_30_1_4 Bool)
(declare-const violation_30_1_5 Bool)
(declare-const violation_occurred Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_broker_officer_violation] 保險代理人、經紀人、公證人違反法令或有礙健全經營
(assert (= agent_broker_officer_violation violation_occurred))

; [insurance:penalty_measures] 主管機關可採取之處分措施
(assert (let ((a!1 (ite restriction_of_business_scope
                1
                (ite dismissal_of_manager_or_staff
                     2
                     (ite dismissal_or_suspension_of_director_or_supervisor
                          3
                          (ite other_necessary_measures 4 0))))))
  (= (ite penalty_measures 1 0) a!1)))

; [insurance:violation_167_2] 違反保險法第163條相關財務或業務管理規定
(assert (= violation_167_2
   (or violate_163_5_applied
       violate_163_7
       violate_165_1
       violate_financial_or_business_management_rules)))

; [insurance:penalty_167_2] 違反第167-2條應限期改正或處罰
(assert (= penalty_167_2
   (or (not correction_made_167_2) fine_imposed_167_2 license_revoked)))

; [insurance:violation_167_3] 違反保險法第165條第三項或第163條第五項準用規定，未建立或未確實執行內部控制等制度
(assert (= violation_167_3
   (or (not solicitation_handling_system_executed)
       (not audit_system_established)
       (not internal_control_established)
       (not solicitation_handling_system_established)
       (not audit_system_executed)
       (not internal_control_executed))))

; [insurance:penalty_167_3] 違反第167-3條應限期改正或處罰
(assert (= penalty_167_3 (or fine_imposed_167_3 (not correction_made_167_3))))

; [finance_consumer_protection:violation_30_1_1] 違反金融消費者保護法第30-1條第1款規定（廣告、招攬、促銷方式或內容）
(assert (= violation_30_1_1 violate_advertising_or_promotion_rules))

; [finance_consumer_protection:violation_30_1_2] 違反第30-1條第2款規定（未充分瞭解消費者資料及適合度）
(assert (= violation_30_1_2 violate_consumer_data_or_suitability_rules))

; [finance_consumer_protection:violation_30_1_3] 違反第30-1條第3款規定（未充分說明金融商品重要內容或揭露風險）
(assert (= violation_30_1_3 violate_disclosure_or_explanation_rules))

; [finance_consumer_protection:violation_30_1_4] 違反第30-1條第4款規定（未訂定或未確實執行酬金制度）
(assert (= violation_30_1_4 violate_compensation_system_rules))

; [finance_consumer_protection:violation_30_1_5] 協助自然人或法人創造形式上符合條件之外觀
(assert (= violation_30_1_5 assist_create_formal_appearance))

; [finance_consumer_protection:penalty_30_1] 違反金融消費者保護法第30-1條規定處罰
(assert (= penalty_30_1
   (or violation_30_1_1
       violation_30_1_2
       violation_30_1_3
       violation_30_1_4
       violation_30_1_5)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一相關法條規定時處罰
(assert (= penalty
   (or agent_broker_officer_violation penalty_167_2 penalty_167_3 penalty_30_1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_occurred true))
(assert (= agent_broker_officer_violation true))
(assert (= violate_consumer_data_or_suitability_rules true))
(assert (= violate_financial_or_business_management_rules true))
(assert (= violate_advertising_or_promotion_rules true))
(assert (= violate_compensation_system_rules true))
(assert (= violation_167_2 true))
(assert (= violation_30_1_1 true))
(assert (= violation_30_1_2 true))
(assert (= violation_30_1_3 true))
(assert (= violation_30_1_4 true))
(assert (= violation_30_1_5 false))
(assert (= violate_163_5_applied false))
(assert (= violate_163_7 false))
(assert (= violate_165_1 false))
(assert (= violation_167_3 true))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= audit_system_established false))
(assert (= audit_system_executed false))
(assert (= solicitation_handling_system_established false))
(assert (= solicitation_handling_system_executed false))
(assert (= correction_made_167_2 false))
(assert (= fine_imposed_167_2 true))
(assert (= license_revoked false))
(assert (= correction_made_167_3 false))
(assert (= fine_imposed_167_3 true))
(assert (= penalty_167_2 true))
(assert (= penalty_167_3 true))
(assert (= penalty_30_1 true))
(assert (= penalty true))
(assert (= restriction_of_business_scope false))
(assert (= dismissal_of_manager_or_staff false))
(assert (= dismissal_or_suspension_of_director_or_supervisor false))
(assert (= other_necessary_measures false))
(assert (= penalty_measures false))
(assert (= assist_create_formal_appearance false))
(assert (= violate_disclosure_or_explanation_rules false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 38
; Total facts: 38
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
