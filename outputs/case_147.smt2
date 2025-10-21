; SMT2 file generated from compliance case automatic
; Case ID: case_147
; Generated at: 2025-10-21T03:10:20.958180
;
; This file can be executed with Z3:
;   z3 case_147.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_broker_not_compliant Bool)
(declare-const agent_broker_penalty_scope Bool)
(declare-const agent_broker_violates_law_or_hinders_stable_operation Bool)
(declare-const assist_create_formal_condition Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const correction_ordered Bool)
(declare-const deregistration_notified Bool)
(declare-const director_supervisor_deregistration_done Bool)
(declare-const dismiss_director_supervisor Bool)
(declare-const dismiss_director_supervisor_executed Bool)
(declare-const dismiss_manager_staff Bool)
(declare-const dismiss_manager_staff_executed Bool)
(declare-const fine_imposed Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const license_revoked Bool)
(declare-const other_measures_executed Bool)
(declare-const penalty Bool)
(declare-const penalty_fine_range Real)
(declare-const penalty_fine_range_extended Real)
(declare-const restriction_business_scope Bool)
(declare-const restriction_business_scope_executed Bool)
(declare-const serious_case Bool)
(declare-const solicitation_handling_system_established Bool)
(declare-const solicitation_handling_system_executed Bool)
(declare-const violate_163_4_7_165_1_163_5 Bool)
(declare-const violate_163_4_7_165_1_163_5_penalty Bool)
(declare-const violate_165_3_163_5 Bool)
(declare-const violate_165_3_163_5_penalty Bool)
(declare-const violate_advertising_or_promotion_rules Bool)
(declare-const violate_advertising_rules Bool)
(declare-const violate_any_finance_consumer_rule Bool)
(declare-const violate_compensation_system Bool)
(declare-const violate_compensation_system_rules Bool)
(declare-const violate_consumer_understanding_or_suitability Bool)
(declare-const violate_disclosure_or_explanation_rules Bool)
(declare-const violate_disclosure_rules Bool)
(declare-const violate_financial_or_business_management_rules Bool)
(declare-const violate_formal_condition Bool)
(declare-const violate_internal_control Bool)
(declare-const violate_understanding_and_suitability Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_broker_not_compliant] 保險代理人、經紀人、公證人違反法令或有礙健全經營
(assert (= agent_broker_not_compliant
   agent_broker_violates_law_or_hinders_stable_operation))

; [insurance:agent_broker_penalty_scope] 主管機關對違規保險代理人等可採取之處分範圍
(assert (and (or (not agent_broker_penalty_scope) agent_broker_not_compliant)
     (or (not agent_broker_not_compliant) agent_broker_penalty_scope)))

; [insurance:penalty_restriction_business_scope] 限制經營或執行業務範圍
(assert (= restriction_business_scope
   (and agent_broker_not_compliant restriction_business_scope_executed)))

; [insurance:penalty_dismiss_manager_staff] 命公司解除經理人或職員職務
(assert (= dismiss_manager_staff
   (and agent_broker_not_compliant dismiss_manager_staff_executed)))

; [insurance:penalty_dismiss_director_supervisor] 解除公司董事、監察人職務或停止執行職務
(assert (= dismiss_director_supervisor
   (and agent_broker_not_compliant dismiss_director_supervisor_executed)))

; [insurance:penalty_other_measures] 其他必要之處置
(assert (= other_measures_executed
   (and agent_broker_not_compliant other_measures_executed)))

; [insurance:director_supervisor_deregistration] 解除董事或監察人職務時通知主管機關註銷登記
(assert (= director_supervisor_deregistration_done
   (and dismiss_director_supervisor deregistration_notified)))

; [insurance:violate_163_4_7_165_1_163_5] 違反第163條第4項管理規則財務或業務管理規定、第163條第7項、第165條第1項或第163條第5項準用規定
(assert (= violate_163_4_7_165_1_163_5 violate_financial_or_business_management_rules))

; [insurance:violate_163_4_7_165_1_163_5_penalty] 違反相關規定應限期改正或處罰
(assert (= violate_163_4_7_165_1_163_5_penalty
   (and violate_163_4_7_165_1_163_5
        (or correction_ordered fine_imposed license_revoked))))

; [insurance:violate_165_3_163_5_internal_control] 違反第165條第3項或第163條第5項準用規定，未建立或未確實執行內部控制、稽核、招攬處理制度或程序
(assert (= violate_internal_control
   (and violate_165_3_163_5
        (or (not audit_system_executed)
            (not internal_control_executed)
            (not internal_control_established)
            (not solicitation_handling_system_executed)
            (not solicitation_handling_system_established)
            (not audit_system_established)))))

; [insurance:violate_165_3_163_5_penalty] 違反內部控制等規定應限期改正或處罰
(assert (= violate_165_3_163_5_penalty
   (and violate_internal_control (or correction_ordered fine_imposed))))

; [finance_consumer:violate_advertising_rules] 違反第8條第2項辦法中廣告、招攬、促銷方式或內容規定
(assert (= violate_advertising_rules violate_advertising_or_promotion_rules))

; [finance_consumer:violate_understanding_and_suitability] 違反第9條第1項未充分瞭解消費者資料及確保適合度，或第9條第2項適合度應考量事項規定
(assert (= violate_understanding_and_suitability
   violate_consumer_understanding_or_suitability))

; [finance_consumer:violate_disclosure_rules] 違反第10條第1項未充分說明金融商品、服務、契約重要內容或揭露風險，或第10條第3項說明揭露方式規定
(assert (= violate_disclosure_rules violate_disclosure_or_explanation_rules))

; [finance_consumer:violate_compensation_system] 違反第11條之一未訂定或未依主管機關核定原則訂定酬金制度或未確實執行
(assert (= violate_compensation_system violate_compensation_system_rules))

; [finance_consumer:penalty_violate_any_rule] 違反金融消費者保護法第30-1條第1款至第4款規定
(assert (= violate_any_finance_consumer_rule
   (or violate_compensation_system
       violate_advertising_rules
       violate_understanding_and_suitability
       violate_disclosure_rules)))

; [finance_consumer:penalty_fine_range] 違反金融消費者保護法第30-1條處罰罰鍰範圍
(assert (= penalty_fine_range (ite violate_any_finance_consumer_rule 1.0 0.0)))

; [finance_consumer:violate_formal_condition] 金融服務業未符合第4條第2項條件，協助創造形式上外觀條件
(assert (= violate_formal_condition assist_create_formal_condition))

; [finance_consumer:penalty_fine_range_extended] 情節重大得加重罰鍰，不受最高額限制
(assert (= penalty_fine_range_extended
   (ite (and violate_any_finance_consumer_rule serious_case) 1.0 0.0)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反保險法及金融消費者保護法相關規定時處罰
(assert (= penalty
   (or agent_broker_not_compliant
       violate_163_4_7_165_1_163_5_penalty
       violate_165_3_163_5_penalty
       violate_any_finance_consumer_rule
       violate_formal_condition)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_broker_violates_law_or_hinders_stable_operation true))
(assert (= agent_broker_not_compliant true))
(assert (= violate_consumer_understanding_or_suitability true))
(assert (= violate_understanding_and_suitability true))
(assert (= violate_internal_control true))
(assert (= violate_165_3_163_5 true))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= audit_system_established false))
(assert (= audit_system_executed false))
(assert (= solicitation_handling_system_established false))
(assert (= solicitation_handling_system_executed false))
(assert (= violate_advertising_or_promotion_rules true))
(assert (= violate_advertising_rules true))
(assert (= violate_compensation_system_rules true))
(assert (= violate_compensation_system true))
(assert (= violate_disclosure_or_explanation_rules true))
(assert (= violate_disclosure_rules true))
(assert (= violate_any_finance_consumer_rule true))
(assert (= correction_ordered true))
(assert (= fine_imposed true))
(assert (= penalty true))
(assert (= agent_broker_penalty_scope true))
(assert (= restriction_business_scope_executed false))
(assert (= restriction_business_scope false))
(assert (= dismiss_manager_staff_executed false))
(assert (= dismiss_manager_staff false))
(assert (= dismiss_director_supervisor_executed false))
(assert (= dismiss_director_supervisor false))
(assert (= deregistration_notified false))
(assert (= director_supervisor_deregistration_done false))
(assert (= other_measures_executed false))
(assert (= assist_create_formal_condition false))
(assert (= serious_case false))
(assert (= license_revoked false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 21
; Total variables: 42
; Total facts: 35
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
