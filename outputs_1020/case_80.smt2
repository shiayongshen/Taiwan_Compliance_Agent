; SMT2 file generated from compliance case automatic
; Case ID: case_80
; Generated at: 2025-10-19T07:25:18.089940
;
; This file can be executed with Z3:
;   z3 case_80.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const advertising_compliance Bool)
(declare-const advertising_ethics_compliance Bool)
(declare-const advertising_prohibition_compliance Bool)
(declare-const advertising_rule_complied Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const business_management_rule_complied Bool)
(declare-const chinese_language_used Bool)
(declare-const consumer_info_compliance Bool)
(declare-const consumer_info_rule_complied Bool)
(declare-const disclosure_compliance Bool)
(declare-const disclosure_fair_and_clear Bool)
(declare-const disclosure_rule_complied Bool)
(declare-const financial_consumer_info_true Bool)
(declare-const financial_management_rule_complied Bool)
(declare-const financial_service_named Bool)
(declare-const formal_condition_violated Bool)
(declare-const formal_condition_violation Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_related_rule_complied Bool)
(declare-const management_rule_compliance Bool)
(declare-const no_exaggerated_performance Bool)
(declare-const no_false_or_fraud Bool)
(declare-const no_false_report_ad Bool)
(declare-const no_guaranteed_principal_or_profit Bool)
(declare-const no_illegible_footnotes Bool)
(declare-const no_law_violation Bool)
(declare-const no_misleading_government_approval Bool)
(declare-const no_promotion_without_approval Bool)
(declare-const no_reputation_damage Bool)
(declare-const no_trademark_confusion Bool)
(declare-const penalty Bool)
(declare-const penalty_serious Bool)
(declare-const remuneration_compliance Bool)
(declare-const remuneration_system_established Bool)
(declare-const remuneration_system_executed Bool)
(declare-const serious_violation Bool)
(declare-const solicitation_handling_system_established Bool)
(declare-const solicitation_handling_system_executed Bool)
(declare-const violation_severity_major Bool)

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

; [insurance:management_rule_compliance] 遵守財務或業務管理相關管理規則及內部控制相關規定
(assert (= management_rule_compliance
   (and financial_management_rule_complied
        business_management_rule_complied
        internal_control_related_rule_complied)))

; [finance_consumer:advertising_compliance] 遵守廣告、業務招攬、營業促銷活動方式及內容規定
(assert (= advertising_compliance advertising_rule_complied))

; [finance_consumer:consumer_info_compliance] 充分瞭解金融消費者資料並確保適合度
(assert (= consumer_info_compliance consumer_info_rule_complied))

; [finance_consumer:disclosure_compliance] 充分說明金融商品、服務、契約重要內容及風險揭露
(assert (= disclosure_compliance disclosure_rule_complied))

; [finance_consumer:remuneration_compliance] 訂定酬金制度並確實執行
(assert (= remuneration_compliance
   (and remuneration_system_established remuneration_system_executed)))

; [finance_consumer:formal_condition_violation] 未符合第四條第二項條件，協助創造形式上外觀條件
(assert (= formal_condition_violation formal_condition_violated))

; [finance_consumer:serious_violation] 違反前二項情形且情節重大
(assert (= serious_violation
   (and (or (not disclosure_compliance)
            formal_condition_violation
            (not consumer_info_compliance)
            (not remuneration_compliance)
            (not advertising_compliance))
        violation_severity_major)))

; [insurance:advertising_ethics_compliance] 金融服務業廣告業務招攬及營業促銷活動遵守社會道德誠信及保護消費者原則
(assert (= advertising_ethics_compliance
   (and financial_consumer_info_true
        disclosure_fair_and_clear
        chinese_language_used
        financial_service_named)))

; [insurance:advertising_prohibition_compliance] 金融服務業廣告業務招攬及營業促銷活動無禁止情事
(assert (= advertising_prohibition_compliance
   (and no_law_violation
        no_false_or_fraud
        no_reputation_damage
        no_trademark_confusion
        no_false_report_ad
        no_exaggerated_performance
        no_misleading_government_approval
        no_promotion_without_approval
        no_guaranteed_principal_or_profit
        no_illegible_footnotes)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一內部控制、管理規則或金融消費者保護相關規定時處罰
(assert (= penalty
   (or formal_condition_violation
       (not internal_control_compliance)
       (not consumer_info_compliance)
       (not disclosure_compliance)
       (not advertising_compliance)
       (not management_rule_compliance)
       (not remuneration_compliance))))

; [meta:penalty_conditions_serious] 處罰條件：情節重大者加重處罰
(assert (= penalty_serious (and serious_violation penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= audit_system_established false))
(assert (= audit_system_executed false))
(assert (= solicitation_handling_system_established false))
(assert (= solicitation_handling_system_executed false))
(assert (= financial_management_rule_complied false))
(assert (= business_management_rule_complied false))
(assert (= internal_control_related_rule_complied false))
(assert (= advertising_rule_complied false))
(assert (= advertising_compliance false))
(assert (= consumer_info_rule_complied false))
(assert (= consumer_info_compliance false))
(assert (= disclosure_rule_complied false))
(assert (= disclosure_compliance false))
(assert (= remuneration_system_established true))
(assert (= remuneration_system_executed true))
(assert (= remuneration_compliance true))
(assert (= formal_condition_violated true))
(assert (= formal_condition_violation true))
(assert (= advertising_ethics_compliance false))
(assert (= financial_consumer_info_true false))
(assert (= disclosure_fair_and_clear false))
(assert (= chinese_language_used true))
(assert (= financial_service_named true))
(assert (= advertising_prohibition_compliance false))
(assert (= no_law_violation false))
(assert (= no_false_or_fraud false))
(assert (= no_reputation_damage true))
(assert (= no_trademark_confusion true))
(assert (= no_false_report_ad false))
(assert (= no_exaggerated_performance false))
(assert (= no_misleading_government_approval false))
(assert (= no_promotion_without_approval false))
(assert (= no_guaranteed_principal_or_profit false))
(assert (= no_illegible_footnotes true))
(assert (= management_rule_compliance false))
(assert (= penalty true))
(assert (= violation_severity_major true))
(assert (= serious_violation true))
(assert (= penalty_serious true))
(assert (= internal_control_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 42
; Total facts: 42
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
