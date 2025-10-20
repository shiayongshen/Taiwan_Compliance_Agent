; SMT2 file generated from compliance case automatic
; Case ID: case_302
; Generated at: 2025-10-19T12:35:39.478159
;
; This file can be executed with Z3:
;   z3 case_302.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const failure_to_prepare_or_report_documents Bool)
(declare-const failure_to_submit_or_obstruct_inspection Bool)
(declare-const futures_assistant_or_staff_violates_prohibited_behaviors Bool)
(declare-const futures_assistant_responsible_or_staff_honest_and_faithful Bool)
(declare-const honesty_credit_principle Bool)
(declare-const improvement_completed Bool)
(declare-const legal_entity_violation Bool)
(declare-const minor_violation_exempted Bool)
(declare-const non_business_staff_performs_business_duties Bool)
(declare-const non_business_staff_restriction Bool)
(declare-const non_business_staff_violates_honesty_credit Bool)
(declare-const other_employees_violates_honesty_credit Bool)
(declare-const other_employees_violates_prohibited_behaviors Bool)
(declare-const penalty Bool)
(declare-const prohibited_behaviors Bool)
(declare-const prohibited_behaviors_list Bool)
(declare-const prohibited_behaviors_other_employees Bool)
(declare-const reported_violation_25_1_detected Bool)
(declare-const reward_for_report Bool)
(declare-const securities_firm_personnel_violation_affecting_business Bool)
(declare-const securities_firm_responsible_and_staff_honest_and_faithful Bool)
(declare-const securities_firm_responsible_and_staff_violates_prohibited_behaviors Bool)
(declare-const violation_14_3_14_1_1_3_14_2_1_3_6_14_3_14_5_1_3_21_1_5_25_1_2_4_31_1_36_5_7_41_43_1_1_43_4_1_43_6_5_7_or_165_1_165_2_applied Bool)
(declare-const violation_14_4_1_2_or_165_1_applied_14_4_1_2_or_14_4_5_or_165_1_applied_14_4_5_procedures Bool)
(declare-const violation_14_6_1st_part_or_165_1_applied_14_6_1st_part_or_14_6_2nd_part_or_165_1_applied_14_6_2nd_part Bool)
(declare-const violation_177_1 Bool)
(declare-const violation_178_1 Bool)
(declare-const violation_178_10 Bool)
(declare-const violation_178_11 Bool)
(declare-const violation_178_12 Bool)
(declare-const violation_178_2 Bool)
(declare-const violation_178_3 Bool)
(declare-const violation_178_4 Bool)
(declare-const violation_178_5 Bool)
(declare-const violation_178_6 Bool)
(declare-const violation_178_7 Bool)
(declare-const violation_178_8 Bool)
(declare-const violation_178_9 Bool)
(declare-const violation_178_any Bool)
(declare-const violation_178_foreign_company Bool)
(declare-const violation_178_minor_exemption_applied Bool)
(declare-const violation_179 Bool)
(declare-const violation_22_2_1_2_26_1_or_165_1_applied_22_2_1_2 Bool)
(declare-const violation_25_1_or_165_1_applied_25_1_rules Bool)
(declare-const violation_26_2_rules Bool)
(declare-const violation_26_3_1_7_8_1st_part_or_165_1_applied_26_3_1_7_8_1st_part_or_26_3_8_2nd_part_or_165_1_applied_26_3_8_2nd_part_procedures Bool)
(declare-const violation_28_2_2_4_7_or_165_1_applied_28_2_2_4_7_or_28_2_3_or_165_1_applied_28_2_3_procedures Bool)
(declare-const violation_36_1_or_165_1_applied_36_1_financial_business_rules Bool)
(declare-const violation_43_2_1_43_3_1_43_5_1_or_165_1_165_2_applied_43_2_1_43_3_1_43_5_1_or_43_1_4_5_or_165_1_165_2_applied_43_1_4_procedures Bool)
(declare-const violation_56 Bool)
(declare-const violation_56_penalty Bool)
(declare-const violation_minor Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_178_1] 違反證券交易法第22條之2第1項、第2項、第26條之一，或第165條之一準用第22條之2第1項、第2項規定
(assert (= violation_178_1 violation_22_2_1_2_26_1_or_165_1_applied_22_2_1_2))

; [securities:violation_178_2] 違反證券交易法第14條第3項、第14條之一第1項、第3項、第14條之2第1項、第3項、第6項、第14條之3、第14條之五第1項至第3項、第21條之一第5項、第25條第1項、第2項、第4項、第31條第1項、第36條第5項、第7項、第41條、第43條之一第1項、第43條之4第1項、第43條之6第5項至第7項規定，或第165條之一或第165條之二準用相關規定
(assert (= violation_178_2
   violation_14_3_14_1_1_3_14_2_1_3_6_14_3_14_5_1_3_21_1_5_25_1_2_4_31_1_36_5_7_41_43_1_1_43_4_1_43_6_5_7_or_165_1_165_2_applied))

; [securities:violation_178_3] 發行人、公開收購人或其關係人、證券商委託人未依主管機關命令提出帳簿、表冊、文件或其他資料，或規避、妨礙、拒絕檢查
(assert (= violation_178_3 failure_to_submit_or_obstruct_inspection))

; [securities:violation_178_4] 發行人、公開收購人未依規定製作、申報、公告、備置或保存帳簿、表冊、傳票、財務報告或其他業務文件
(assert (= violation_178_4 failure_to_prepare_or_report_documents))

; [securities:violation_178_5] 違反第14條之4第1項、第2項或第165條之一準用第14條之4第1項、第2項規定，或違反第14條之4第5項、第165條之一準用該項辦法有關作業程序、職權行使或議事錄應載明事項規定
(assert (= violation_178_5
   violation_14_4_1_2_or_165_1_applied_14_4_1_2_or_14_4_5_or_165_1_applied_14_4_5_procedures))

; [securities:violation_178_6] 違反第14條之6第1項前段或第165條之一準用該項前段規定未設置薪資報酬委員會，或違反第14條之6第1項後段、第165條之一準用該項後段辦法有關成員資格、組成、作業程序、職權行使、議事錄或公告申報規定
(assert (= violation_178_6
   violation_14_6_1st_part_or_165_1_applied_14_6_1st_part_or_14_6_2nd_part_or_165_1_applied_14_6_2nd_part))

; [securities:violation_178_7] 違反第25條之一或第165條之一準用該條規定有關徵求人、受託代理人資格、委託書徵求與取得方式、股東會公司應遵守事項及主管機關要求提供資料拒絕提供規定
(assert (= violation_178_7 violation_25_1_or_165_1_applied_25_1_rules))

; [securities:violation_178_8] 違反主管機關依第26條第2項所定公開發行公司董事監察人股權成數及查核實施規則有關通知及查核規定
(assert (= violation_178_8 violation_26_2_rules))

; [securities:violation_178_9] 違反第26條之3第1項、第7項、第8項前段或第165條之一準用第26條之3第1項、第7項、第8項前段規定，或違反第26條之3第8項後段、第165條之一準用該項後段辦法有關主要議事內容、作業程序、議事錄或公告規定
(assert (= violation_178_9
   violation_26_3_1_7_8_1st_part_or_165_1_applied_26_3_1_7_8_1st_part_or_26_3_8_2nd_part_or_165_1_applied_26_3_8_2nd_part_procedures))

; [securities:violation_178_10] 違反第28條之2第2項、第4項至第7項或第165條之一準用第28條之2第2項、第4項至第7項規定，或違反第28條之2第3項、第165條之一準用該項辦法有關買回股份程序、價格、數量、方式、轉讓方法或申報公告事項規定
(assert (= violation_178_10
   violation_28_2_2_4_7_or_165_1_applied_28_2_2_4_7_or_28_2_3_or_165_1_applied_28_2_3_procedures))

; [securities:violation_178_11] 違反第36條之一或第165條之一準用該條準則有關取得或處分資產、衍生性商品交易、資金貸與、背書保證及揭露財務預測資訊等重大財務業務行為規定
(assert (= violation_178_11
   violation_36_1_or_165_1_applied_36_1_financial_business_rules))

; [securities:violation_178_12] 違反第43條之2第1項、第43條之3第1項、第43條之5第1項或第165條之一、第165條之二準用第43條之2第1項、第43條之3第1項、第43條之5第1項規定，或違反第43條之一第4項、第5項、第165條之一、第165條之二準用第43條之一第4項辦法有關收購有價證券範圍、條件、期間、關係人或申報公告事項規定
(assert (= violation_178_12
   violation_43_2_1_43_3_1_43_5_1_or_165_1_165_2_applied_43_2_1_43_3_1_43_5_1_or_43_1_4_5_or_165_1_165_2_applied_43_1_4_procedures))

; [securities:violation_178_foreign_company] 外國公司為發行人時，違反第178條第3款或第4款規定
(assert (= violation_178_foreign_company (or violation_178_3 violation_178_4)))

; [securities:minor_violation_exempted] 違反第178條規定情節輕微者，得免處罰或先限期改善，已改善完成者免處罰
(assert (= minor_violation_exempted (or improvement_completed violation_minor)))

; [securities:reward_for_report] 檢舉違反第25條之一案件因而查獲者，應予獎勵
(assert (= reward_for_report reported_violation_25_1_detected))

; [securities:violation_179] 法人及外國公司違反本法規定，除第177條之一及第178條規定外，依本章各條規定處罰其行為負責人
(assert (= violation_179
   (and legal_entity_violation (not (or violation_177_1 violation_178_any)))))

; [securities:violation_178_any] 違反第178條任一款規定
(assert (= violation_178_any
   (or violation_178_8
       violation_178_11
       violation_178_2
       violation_178_6
       violation_178_5
       violation_178_3
       violation_178_12
       violation_178_1
       violation_178_4
       violation_178_7
       violation_178_10
       violation_178_9)))

; [securities:violation_178_minor_exemption_applied] 違反第178條但情節輕微且已改善完成者免處罰
(assert (= violation_178_minor_exemption_applied
   (or minor_violation_exempted (not violation_178_any))))

; [securities:violation_56] 證券商董事、監察人及受僱人有違反本法或相關法令行為，足以影響證券業務正常執行
(assert (= violation_56 securities_firm_personnel_violation_affecting_business))

; [securities:violation_56_penalty] 證券商因違反第56條規定，得命停止業務或解除職務，並處以第66條所定處分
(assert (= violation_56_penalty violation_56))

; [futures:honesty_credit_principle] 證券交易輔助人負責人或業務人員應本誠實及信用原則忠實執行業務
(assert (= honesty_credit_principle
   futures_assistant_responsible_or_staff_honest_and_faithful))

; [futures:prohibited_behaviors] 證券交易輔助人及人員不得有證券商管理規則第37條及證券商負責人與業務人員管理規則第18條禁止之行為
(assert (not (= futures_assistant_or_staff_violates_prohibited_behaviors
        prohibited_behaviors)))

; [futures:non_business_staff_restriction] 非業務人員不得違反誠實信用原則且不得執行業務人員職務或代理業務人員職務
(assert (= non_business_staff_restriction
   (and (not non_business_staff_violates_honesty_credit)
        (not non_business_staff_performs_business_duties))))

; [securities_firm:honesty_credit_principle] 證券商負責人及業務人員執行業務應本誠實及信用原則
(assert (= honesty_credit_principle
   securities_firm_responsible_and_staff_honest_and_faithful))

; [securities_firm:prohibited_behaviors_list] 證券商負責人及業務人員不得有證券商管理法令禁止之行為
(assert (not (= securities_firm_responsible_and_staff_violates_prohibited_behaviors
        prohibited_behaviors_list)))

; [securities_firm:prohibited_behaviors_other_employees] 證券商其他受僱人不得違反誠實信用原則及不得為證券商負責人及業務人員禁止之行為
(assert (= prohibited_behaviors_other_employees
   (and (not other_employees_violates_honesty_credit)
        (not other_employees_violates_prohibited_behaviors))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第178條任一款規定且未屬輕微情節或未改善完成，或違反第179條規定，或違反第56條規定，或違反期貨商及證券商誠實信用及禁止行為規定
(assert (= penalty
   (or (not prohibited_behaviors_list)
       (not honesty_credit_principle)
       (not non_business_staff_restriction)
       (and violation_178_any (not minor_violation_exempted))
       violation_56_penalty
       (not prohibited_behaviors)
       violation_179
       (not prohibited_behaviors_other_employees))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= failure_to_prepare_or_report_documents false))
(assert (= failure_to_submit_or_obstruct_inspection true))
(assert (= futures_assistant_or_staff_violates_prohibited_behaviors true))
(assert (= futures_assistant_responsible_or_staff_honest_and_faithful false))
(assert (= honesty_credit_principle false))
(assert (= improvement_completed false))
(assert (= legal_entity_violation true))
(assert (= minor_violation_exempted false))
(assert (= non_business_staff_performs_business_duties false))
(assert (= non_business_staff_restriction false))
(assert (= non_business_staff_violates_honesty_credit false))
(assert (= other_employees_violates_honesty_credit false))
(assert (= other_employees_violates_prohibited_behaviors false))
(assert (= penalty true))
(assert (= prohibited_behaviors false))
(assert (= prohibited_behaviors_list false))
(assert (= prohibited_behaviors_other_employees false))
(assert (= reported_violation_25_1_detected false))
(assert (= reward_for_report false))
(assert (= securities_firm_personnel_violation_affecting_business true))
(assert (= securities_firm_responsible_and_staff_honest_and_faithful false))
(assert (= securities_firm_responsible_and_staff_violates_prohibited_behaviors true))
(assert (= violation_14_3_14_1_1_3_14_2_1_3_6_14_3_14_5_1_3_21_1_5_25_1_2_4_31_1_36_5_7_41_43_1_1_43_4_1_43_6_5_7_or_165_1_165_2_applied false))
(assert (= violation_14_4_1_2_or_165_1_applied_14_4_1_2_or_14_4_5_or_165_1_applied_14_4_5_procedures false))
(assert (= violation_14_6_1st_part_or_165_1_applied_14_6_1st_part_or_14_6_2nd_part_or_165_1_applied_14_6_2nd_part false))
(assert (= violation_177_1 false))
(assert (= violation_178_1 true))
(assert (= violation_178_10 false))
(assert (= violation_178_11 false))
(assert (= violation_178_12 false))
(assert (= violation_178_2 false))
(assert (= violation_178_3 true))
(assert (= violation_178_4 false))
(assert (= violation_178_5 false))
(assert (= violation_178_6 false))
(assert (= violation_178_7 true))
(assert (= violation_178_8 false))
(assert (= violation_178_9 false))
(assert (= violation_178_any true))
(assert (= violation_178_foreign_company false))
(assert (= violation_178_minor_exemption_applied false))
(assert (= violation_179 true))
(assert (= violation_22_2_1_2_26_1_or_165_1_applied_22_2_1_2 false))
(assert (= violation_25_1_or_165_1_applied_25_1_rules false))
(assert (= violation_26_2_rules false))
(assert (= violation_26_3_1_7_8_1st_part_or_165_1_applied_26_3_1_7_8_1st_part_or_26_3_8_2nd_part_or_165_1_applied_26_3_8_2nd_part_procedures false))
(assert (= violation_28_2_2_4_7_or_165_1_applied_28_2_2_4_7_or_28_2_3_or_165_1_applied_28_2_3_procedures false))
(assert (= violation_36_1_or_165_1_applied_36_1_financial_business_rules false))
(assert (= violation_56 true))
(assert (= violation_56_penalty true))
(assert (= violation_minor false))
(assert (= violation_43_2_1_43_3_1_43_5_1_or_165_1_165_2_applied_43_2_1_43_3_1_43_5_1_or_43_1_4_5_or_165_1_165_2_applied_43_1_4_procedures false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 28
; Total variables: 52
; Total facts: 52
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
