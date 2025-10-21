; SMT2 file generated from compliance case automatic
; Case ID: case_132
; Generated at: 2025-10-21T02:37:08.050193
;
; This file can be executed with Z3:
;   z3 case_132.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agency_name_notified Bool)
(declare-const agent_penalty_measures Bool)
(declare-const agent_violation_penalty Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const central_authority_designated_plan Bool)
(declare-const collection_for_statutory_duties Bool)
(declare-const collection_purpose_notified Bool)
(declare-const data_category_notified Bool)
(declare-const data_usage_period_region_object_method_notified Bool)
(declare-const dismiss_manager_or_staff Bool)
(declare-const dismiss_or_suspend_director_or_supervisor Bool)
(declare-const exempt_by_law Bool)
(declare-const impact_of_not_providing_notified Bool)
(declare-const impede_sound_operation Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const no_adverse_effect Bool)
(declare-const non_profit_collection Bool)
(declare-const non_public_agency_has_personal_data Bool)
(declare-const notice_compliance Bool)
(declare-const notice_exempt Bool)
(declare-const notice_required Bool)
(declare-const notification_hinders_public_interest Bool)
(declare-const notification_hinders_statutory_duties Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const penalty_167_2 Bool)
(declare-const penalty_167_3 Bool)
(declare-const penalty_48_major Bool)
(declare-const penalty_48_minor Bool)
(declare-const restrict_business_scope Bool)
(declare-const rights_and_methods_notified Bool)
(declare-const safety_measures_27_1 Bool)
(declare-const safety_measures_required Bool)
(declare-const safety_plan_27_2_defined Bool)
(declare-const safety_plan_designated Bool)
(declare-const solicitation_handling_system_established Bool)
(declare-const solicitation_handling_system_executed Bool)
(declare-const subject_already_aware Bool)
(declare-const violate_163_4_financial_or_business_management Bool)
(declare-const violate_163_5_applied Bool)
(declare-const violate_163_7 Bool)
(declare-const violate_165_1 Bool)
(declare-const violate_article_10_to_13 Bool)
(declare-const violate_article_20_2_or_3 Bool)
(declare-const violate_article_8_or_9 Bool)
(declare-const violate_law Bool)
(declare-const violation_167_2 Bool)
(declare-const violation_167_3 Bool)
(declare-const violation_48_1 Bool)
(declare-const violation_48_2 Bool)
(declare-const violation_48_3 Bool)
(declare-const violation_48_4 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_violation_penalty] 保險代理人、經紀人、公證人違反法令或有礙健全經營之虞時主管機關可處分
(assert (= agent_violation_penalty (or violate_law impede_sound_operation)))

; [insurance:agent_penalty_measures] 主管機關可採取限制經營範圍、解除職務、停止職務或其他處置
(assert (= agent_penalty_measures
   (or restrict_business_scope
       other_necessary_measures
       dismiss_or_suspend_director_or_supervisor
       dismiss_manager_or_staff)))

; [insurance:violation_167_2] 違反163條相關財務或業務管理規定應限期改正或處罰
(assert (= violation_167_2
   (or violate_163_5_applied
       violate_163_7
       violate_165_1
       violate_163_4_financial_or_business_management)))

; [insurance:penalty_167_2] 違反167-2條限期改正或處罰罰鍰，情節重大者廢止許可並註銷執照
(assert (= penalty_167_2 violation_167_2))

; [insurance:violation_167_3] 違反165條第三項或163條第五項準用規定，未建立或未確實執行內部控制等制度
(assert (= violation_167_3
   (or (not solicitation_handling_system_executed)
       (not internal_control_established)
       (not solicitation_handling_system_established)
       (not audit_system_established)
       (not audit_system_executed)
       (not internal_control_executed))))

; [insurance:penalty_167_3] 違反167-3條限期改正或處罰罰鍰
(assert (= penalty_167_3 violation_167_3))

; [privacy:notice_required] 蒐集個人資料時應明確告知六項事項
(assert (= notice_required
   (and agency_name_notified
        collection_purpose_notified
        data_category_notified
        data_usage_period_region_object_method_notified
        rights_and_methods_notified
        impact_of_not_providing_notified)))

; [privacy:notice_exempt] 符合免告知情形之一
(assert (= notice_exempt
   (or subject_already_aware
       (and non_profit_collection no_adverse_effect)
       notification_hinders_statutory_duties
       collection_for_statutory_duties
       notification_hinders_public_interest
       exempt_by_law)))

; [privacy:notice_compliance] 蒐集個人資料時應告知或符合免告知情形
(assert (= notice_compliance (or notice_exempt notice_required)))

; [privacy:safety_measures_required] 非公務機關應採行適當安全措施防止個資被竊取等
(assert (= safety_measures_required non_public_agency_has_personal_data))

; [privacy:safety_plan_designated] 中央主管機關得指定非公務機關訂定安全維護計畫及處理方法
(assert (= safety_plan_designated central_authority_designated_plan))

; [privacy:violation_48_1] 非公務機關違反第8或9條規定
(assert (= violation_48_1 violate_article_8_or_9))

; [privacy:violation_48_2] 非公務機關違反第10至13條規定
(assert (= violation_48_2 violate_article_10_to_13))

; [privacy:violation_48_3] 非公務機關違反第20條第二項或第三項規定
(assert (= violation_48_3 violate_article_20_2_or_3))

; [privacy:violation_48_4] 非公務機關違反第27條第一項或未依第二項訂定安全維護計畫或處理方法
(assert (= violation_48_4
   (or (not safety_measures_27_1) (not safety_plan_27_2_defined))))

; [privacy:penalty_48_minor] 違反48條第一款至第三款規定，限期改正，未改正處罰
(assert (= penalty_48_minor (or violation_48_1 violation_48_2 violation_48_3)))

; [privacy:penalty_48_major] 違反48條第四款規定，限期改正，未改正按次處罰
(assert (= penalty_48_major violation_48_4))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反保險法或個資法相關規定時處罰
(assert (= penalty
   (or penalty_167_3
       penalty_48_major
       agent_violation_penalty
       penalty_48_minor
       penalty_167_2)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_law true))
(assert (= impede_sound_operation true))
(assert (= agent_violation_penalty true))
(assert (= violate_163_4_financial_or_business_management true))
(assert (= violate_163_7 true))
(assert (= violate_165_1 false))
(assert (= violate_163_5_applied false))
(assert (= violation_167_2 true))
(assert (= penalty_167_2 true))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= audit_system_established false))
(assert (= audit_system_executed false))
(assert (= solicitation_handling_system_established false))
(assert (= solicitation_handling_system_executed false))
(assert (= violation_167_3 true))
(assert (= penalty_167_3 true))
(assert (= agency_name_notified false))
(assert (= collection_purpose_notified false))
(assert (= data_category_notified false))
(assert (= data_usage_period_region_object_method_notified false))
(assert (= rights_and_methods_notified false))
(assert (= impact_of_not_providing_notified false))
(assert (= notice_required false))
(assert (= exempt_by_law false))
(assert (= collection_for_statutory_duties false))
(assert (= notification_hinders_statutory_duties false))
(assert (= notification_hinders_public_interest false))
(assert (= subject_already_aware false))
(assert (= non_profit_collection false))
(assert (= no_adverse_effect false))
(assert (= notice_exempt false))
(assert (= notice_compliance false))
(assert (= non_public_agency_has_personal_data true))
(assert (= safety_measures_required true))
(assert (= safety_measures_27_1 false))
(assert (= safety_plan_27_2_defined false))
(assert (= central_authority_designated_plan false))
(assert (= safety_plan_designated false))
(assert (= violate_article_8_or_9 true))
(assert (= violation_48_1 true))
(assert (= violate_article_10_to_13 false))
(assert (= violation_48_2 false))
(assert (= violate_article_20_2_or_3 false))
(assert (= violation_48_3 false))
(assert (= violation_48_4 true))
(assert (= penalty_48_minor true))
(assert (= penalty_48_major true))
(assert (= penalty true))
(assert (= agent_penalty_measures false))
(assert (= restrict_business_scope false))
(assert (= dismiss_manager_or_staff false))
(assert (= dismiss_or_suspend_director_or_supervisor false))
(assert (= other_necessary_measures false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 19
; Total variables: 54
; Total facts: 54
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
