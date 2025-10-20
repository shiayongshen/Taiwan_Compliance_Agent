; SMT2 file generated from compliance case automatic
; Case ID: case_132
; Generated at: 2025-10-19T08:49:13.666772
;
; This file can be executed with Z3:
;   z3 case_132.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agency_name_notified Bool)
(declare-const agent_broker_officer_violation Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const collection_for_statutory_duty Bool)
(declare-const collection_not_for_profit Bool)
(declare-const collection_purpose_notified Bool)
(declare-const data_category_notified Bool)
(declare-const exempt_by_law Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_penalty Bool)
(declare-const internal_control_violation Bool)
(declare-const management_rule_penalty Bool)
(declare-const management_rule_violation Bool)
(declare-const no_adverse_effect Bool)
(declare-const non_public_agency_security_compliance Bool)
(declare-const non_public_agency_security_measures Bool)
(declare-const non_public_agency_security_plan_established Bool)
(declare-const non_public_agency_violation_27 Bool)
(declare-const non_public_agency_violation_8_9_10_11_12_13_20 Bool)
(declare-const non_public_agency_violation_penalty Bool)
(declare-const notice_hinders_public_interest Bool)
(declare-const notice_hinders_statutory_duty Bool)
(declare-const penalty Bool)
(declare-const penalty_measures_allowed Bool)
(declare-const personal_data_collection_notice_compliance Bool)
(declare-const personal_data_collection_notice_provided Bool)
(declare-const personal_data_collection_notice_required Bool)
(declare-const post_termination_data_handling_established Bool)
(declare-const rights_and_methods_notified Bool)
(declare-const security_measures_implemented Bool)
(declare-const security_plan_established Bool)
(declare-const serious_violation Bool)
(declare-const solicitation_handling_established Bool)
(declare-const solicitation_handling_executed Bool)
(declare-const subject_already_knows_notice Bool)
(declare-const usage_period_region_object_method_notified Bool)
(declare-const violate_10 Bool)
(declare-const violate_11 Bool)
(declare-const violate_12 Bool)
(declare-const violate_13 Bool)
(declare-const violate_163_4 Bool)
(declare-const violate_163_5_applied Bool)
(declare-const violate_163_7 Bool)
(declare-const violate_165_1 Bool)
(declare-const violate_20_2 Bool)
(declare-const violate_20_3 Bool)
(declare-const violate_8 Bool)
(declare-const violate_9 Bool)
(declare-const violation_occurred Bool)
(declare-const voluntary_provision_notice_notified Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_broker_officer_violation] 保險代理人、經紀人、公證人違反法令或有礙健全經營
(assert (= agent_broker_officer_violation violation_occurred))

; [insurance:penalty_measures] 主管機關可採取限制經營、解除職務、停止職務或其他處置
(assert (= penalty_measures_allowed agent_broker_officer_violation))

; [insurance:management_rule_violation] 違反財務或業務管理規定
(assert (= management_rule_violation
   (or violate_165_1 violate_163_4 violate_163_5_applied violate_163_7)))

; [insurance:management_rule_penalty] 違反管理規則應限期改正或處罰，情節重大者廢止許可並註銷執業證照
(assert (= management_rule_penalty (or management_rule_violation serious_violation)))

; [insurance:internal_control_violation] 未建立或未確實執行內部控制、稽核制度、招攬處理制度或程序
(assert (= internal_control_violation
   (or (not solicitation_handling_executed)
       (not internal_control_established)
       (not solicitation_handling_established)
       (not internal_control_executed)
       (not audit_system_established)
       (not audit_system_executed))))

; [insurance:internal_control_penalty] 未建立或未確實執行內部控制等制度應限期改正或處罰
(assert (= internal_control_penalty internal_control_violation))

; [privacy:personal_data_collection_notice_required] 蒐集個人資料時應明確告知當事人事項
(assert (not (= (or collection_for_statutory_duty
            (and collection_not_for_profit no_adverse_effect)
            subject_already_knows_notice
            exempt_by_law
            notice_hinders_public_interest
            notice_hinders_statutory_duty)
        personal_data_collection_notice_required)))

; [privacy:personal_data_collection_notice_provided] 已明確告知當事人蒐集個人資料相關事項
(assert (= personal_data_collection_notice_provided
   (and agency_name_notified
        collection_purpose_notified
        data_category_notified
        usage_period_region_object_method_notified
        rights_and_methods_notified
        voluntary_provision_notice_notified)))

; [privacy:personal_data_collection_notice_compliance] 蒐集個人資料時符合告知義務
(assert (= personal_data_collection_notice_compliance
   (or (not personal_data_collection_notice_required)
       personal_data_collection_notice_provided)))

; [privacy:non_public_agency_security_measures] 非公務機關採行適當安全措施防止個資被竊取、竄改、毀損、滅失或洩漏
(assert (= non_public_agency_security_measures security_measures_implemented))

; [privacy:non_public_agency_security_plan_established] 非公務機關訂定個人資料檔案安全維護計畫及業務終止後資料處理方法
(assert (= non_public_agency_security_plan_established
   (and security_plan_established post_termination_data_handling_established)))

; [privacy:non_public_agency_security_compliance] 非公務機關符合安全措施及計畫要求
(assert (= non_public_agency_security_compliance
   (and non_public_agency_security_measures
        non_public_agency_security_plan_established)))

; [privacy:non_public_agency_violation_8_9_10_11_12_13_20] 非公務機關違反個資法第8、9、10、11、12、13、20條規定
(assert (= non_public_agency_violation_8_9_10_11_12_13_20
   (or violate_20_2
       violate_13
       violate_12
       violate_11
       violate_20_3
       violate_10
       violate_8
       violate_9)))

; [privacy:non_public_agency_violation_27] 非公務機關違反第27條第一項或未依第二項訂定安全維護計畫或處理方法
(assert (= non_public_agency_violation_27
   (or (not post_termination_data_handling_established)
       (not security_plan_established)
       (not security_measures_implemented))))

; [privacy:non_public_agency_violation_penalty] 非公務機關違反規定應限期改正，未改正者處罰
(assert (= non_public_agency_violation_penalty
   (or non_public_agency_violation_27
       non_public_agency_violation_8_9_10_11_12_13_20)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反保險法或個資法相關規定時處罰
(assert (= penalty
   (or (not personal_data_collection_notice_compliance)
       internal_control_penalty
       agent_broker_officer_violation
       management_rule_penalty
       (not non_public_agency_security_compliance)
       non_public_agency_violation_penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_occurred true))
(assert (= agent_broker_officer_violation true))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= audit_system_established false))
(assert (= audit_system_executed false))
(assert (= solicitation_handling_established false))
(assert (= solicitation_handling_executed false))
(assert (= management_rule_violation true))
(assert (= violate_163_4 true))
(assert (= violate_163_7 true))
(assert (= violate_165_1 false))
(assert (= violate_163_5_applied false))
(assert (= personal_data_collection_notice_required true))
(assert (= agency_name_notified false))
(assert (= collection_purpose_notified false))
(assert (= data_category_notified false))
(assert (= usage_period_region_object_method_notified false))
(assert (= rights_and_methods_notified false))
(assert (= voluntary_provision_notice_notified false))
(assert (= exempt_by_law false))
(assert (= collection_for_statutory_duty false))
(assert (= notice_hinders_statutory_duty false))
(assert (= notice_hinders_public_interest false))
(assert (= subject_already_knows_notice false))
(assert (= collection_not_for_profit false))
(assert (= no_adverse_effect false))
(assert (= personal_data_collection_notice_provided false))
(assert (= personal_data_collection_notice_compliance false))
(assert (= security_measures_implemented false))
(assert (= security_plan_established false))
(assert (= post_termination_data_handling_established false))
(assert (= non_public_agency_security_measures false))
(assert (= non_public_agency_security_plan_established false))
(assert (= non_public_agency_security_compliance false))
(assert (= non_public_agency_violation_27 true))
(assert (= violate_8 true))
(assert (= violate_9 false))
(assert (= violate_10 false))
(assert (= violate_11 false))
(assert (= violate_12 false))
(assert (= violate_13 false))
(assert (= violate_20_2 false))
(assert (= violate_20_3 false))
(assert (= non_public_agency_violation_8_9_10_11_12_13_20 true))
(assert (= non_public_agency_violation_penalty true))
(assert (= internal_control_violation true))
(assert (= internal_control_penalty true))
(assert (= management_rule_penalty true))
(assert (= serious_violation false))
(assert (= penalty_measures_allowed true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 52
; Total facts: 52
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
