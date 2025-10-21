; SMT2 file generated from compliance case automatic
; Case ID: case_302
; Generated at: 2025-10-21T06:44:04.575878
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
(declare-const honest_faithful_execution Bool)
(declare-const honest_faithful_execution_18 Bool)
(declare-const improvement_completed Bool)
(declare-const improvement_ordered Bool)
(declare-const non_business_employee_restriction_32 Bool)
(declare-const other_employees_prohibition_18 Bool)
(declare-const penalty Bool)
(declare-const penalty_exempted Bool)
(declare-const perform_or_agent_business_duties Bool)
(declare-const prohibited_behavior_18 Bool)
(declare-const prohibited_behavior_32 Bool)
(declare-const prohibited_behavior_other_employees Bool)
(declare-const responsible_person_penalty Bool)
(declare-const securities_assistant_duty_32 Bool)
(declare-const securities_assistant_prohibited_32 Bool)
(declare-const securities_business_sanction_56 Bool)
(declare-const securities_business_violation_56 Bool)
(declare-const securities_responsible_and_staff_duty_18 Bool)
(declare-const securities_responsible_and_staff_prohibited_18 Bool)
(declare-const violate_32 Bool)
(declare-const violation_14_4_related Bool)
(declare-const violation_14_6_related Bool)
(declare-const violation_14_related Bool)
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
(declare-const violation_22_2_1_2 Bool)
(declare-const violation_25_1_related Bool)
(declare-const violation_26_2_related Bool)
(declare-const violation_26_3_related Bool)
(declare-const violation_28_2_related Bool)
(declare-const violation_36_1_related Bool)
(declare-const violation_43_related Bool)
(declare-const violation_56 Bool)
(declare-const violation_foreign_178_3_4 Bool)
(declare-const violation_mild Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_178_1] 違反證券交易法第22條之2第1項、第2項、第26條之一，或第165條之一準用第22條之2第1項、第2項規定
(assert (= violation_178_1 violation_22_2_1_2))

; [securities:violation_178_2] 違反證券交易法第14條第3項、第14條之一第1項、第3項、第14條之二第1項、第3項、第6項、第14條之三、第14條之五第1項至第3項、第21條之一第5項、第25條第1項、第2項、第4項、第31條第1項、第36條第5項、第7項、第41條、第43條之一第1項、第43條之四第1項、第43條之六第5項至第7項規定，或第165條之一或第165條之二準用相關條文規定
(assert (= violation_178_2 violation_14_related))

; [securities:violation_178_3] 發行人、公開收購人或其關係人、證券商委託人未依主管機關命令提出帳簿、表冊、文件或其他資料，或規避、妨礙、拒絕檢查
(assert (= violation_178_3 failure_to_submit_or_obstruct_inspection))

; [securities:violation_178_4] 發行人、公開收購人未依規定製作、申報、公告、備置或保存帳簿、表冊、傳票、財務報告或其他業務文件
(assert (= violation_178_4 failure_to_prepare_or_report_documents))

; [securities:violation_178_5] 違反第14條之四第1項、第2項或第165條之一準用該條規定，或違反第14條之四第5項、第165條之一準用該項辦法有關作業程序、職權行使或議事錄應載明事項規定
(assert (= violation_178_5 violation_14_4_related))

; [securities:violation_178_6] 違反第14條之六第1項前段或第165條之一準用該段規定未設置薪資報酬委員會，或違反第14條之六第1項後段、第165條之一準用該段辦法有關成員資格、組成、作業程序、職權行使、議事錄或公告申報規定
(assert (= violation_178_6 violation_14_6_related))

; [securities:violation_178_7] 違反第25條之一或第165條之一準用該條規定有關徵求人、受託代理人資格條件、委託書徵求與取得方式、股東會公司應遵守事項及主管機關要求提供資料拒絕提供規定
(assert (= violation_178_7 violation_25_1_related))

; [securities:violation_178_8] 違反主管機關依第26條第2項所定公開發行公司董事監察人股權成數及查核實施規則有關通知及查核規定
(assert (= violation_178_8 violation_26_2_related))

; [securities:violation_178_9] 違反第26條之三第1項、第7項、第8項前段或第165條之一準用該條規定，或違反第26條之三第8項後段、第165條之一準用該段辦法有關主要議事內容、作業程序、議事錄或公告規定
(assert (= violation_178_9 violation_26_3_related))

; [securities:violation_178_10] 違反第28條之二第2項、第4項至第7項或第165條之一準用該條規定，或違反第28條之二第3項、第165條之一準用該項辦法有關買回股份程序、價格、數量、方式、轉讓方法或申報公告事項規定
(assert (= violation_178_10 violation_28_2_related))

; [securities:violation_178_11] 違反第36條之一或第165條之一準用該條規定有關取得或處分資產、衍生性商品交易、資金貸與、背書保證及揭露財務預測資訊等重大財務業務行為規定
(assert (= violation_178_11 violation_36_1_related))

; [securities:violation_178_12] 違反第43條之二第1項、第43條之三第1項、第43條之五第1項或第165條之一、第165條之二準用相關條文規定，或違反第43條之一第4項、第5項、第165條之一、第165條之二準用該條辦法有關收購有價證券範圍、條件、期間、關係人或申報公告事項規定
(assert (= violation_178_12 violation_43_related))

; [securities:violation_foreign_company_178_3_4] 外國公司為發行人時，違反第178條第3款或第4款規定
(assert (= violation_foreign_178_3_4 (or violation_178_3 violation_178_4)))

; [securities:penalty_exemption] 違反行為情節輕微且已改善完成者免予處罰
(assert (= penalty_exempted (and violation_mild improvement_completed)))

; [securities:penalty_improvement_ordered] 違反行為情節輕微得先命限期改善
(assert (= improvement_ordered (and violation_mild (not improvement_completed))))

; [securities:responsible_person_penalty_179] 法人及外國公司違反本法規定，依第177條之一及第178條規定處罰其負責人
(assert (= responsible_person_penalty
   (or violation_178_4
       violation_178_11
       violation_178_1
       violation_178_2
       violation_177_1
       violation_178_10
       violation_178_12
       violation_178_3
       violation_178_5
       violation_178_6
       violation_178_7
       violation_178_9
       violation_178_8)))

; [securities:securities_business_violation_56] 證券商董事、監察人及受僱人違反本法或相關法令，影響證券業務正常執行
(assert (= securities_business_violation_56 violation_56))

; [securities:securities_business_sanction_56] 證券商因違反第56條規定，得命停止業務或解除職務，並處分
(assert (= securities_business_sanction_56 securities_business_violation_56))

; [securities:securities_assistant_duty_32] 證券交易輔助人負責人或業務人員應誠實信用忠實執行業務
(assert (= securities_assistant_duty_32 honest_faithful_execution))

; [securities:securities_assistant_prohibited_32] 證券交易輔助人及人員不得有證券商管理規則第37條及負責人與業務人員管理規則第18條禁止行為
(assert (not (= prohibited_behavior_32 securities_assistant_prohibited_32)))

; [securities:non_business_employee_restriction_32] 非業務人員不得違反前述規定且不得執行或代理業務人員職務
(assert (= non_business_employee_restriction_32
   (and (not violate_32) (not perform_or_agent_business_duties))))

; [securities:securities_responsible_and_staff_duty_18] 證券商負責人及業務人員執行業務應誠實信用
(assert (= securities_responsible_and_staff_duty_18 honest_faithful_execution_18))

; [securities:securities_responsible_and_staff_prohibited_18] 證券商負責人及業務人員不得有證券商管理法令禁止之行為
(assert (not (= prohibited_behavior_18 securities_responsible_and_staff_prohibited_18)))

; [securities:other_employees_prohibition_18] 證券商其他受僱人不得有證券商管理法令禁止之行為
(assert (not (= prohibited_behavior_other_employees other_employees_prohibition_18)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反證券交易法第178條任一款規定且未符合免罰或改善完成條件時處罰
(assert (= penalty
   (and (or violation_178_4
            violation_178_11
            violation_178_1
            violation_178_2
            violation_178_10
            violation_178_12
            violation_178_3
            violation_178_5
            violation_178_6
            violation_178_7
            violation_178_9
            violation_178_8)
        (not penalty_exempted))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= failure_to_submit_or_obstruct_inspection true))
(assert (= violation_178_3 true))
(assert (= responsible_person_penalty true))
(assert (= penalty true))
(assert (= penalty_exempted false))
(assert (= improvement_completed false))
(assert (= violation_56 true))
(assert (= securities_business_violation_56 true))
(assert (= securities_business_sanction_56 true))
(assert (= prohibited_behavior_32 true))
(assert (= securities_assistant_prohibited_32 false))
(assert (= securities_assistant_duty_32 false))
(assert (= honest_faithful_execution false))
(assert (= honest_faithful_execution_18 false))
(assert (= prohibited_behavior_18 true))
(assert (= securities_responsible_and_staff_prohibited_18 false))
(assert (= securities_responsible_and_staff_duty_18 false))
(assert (= prohibited_behavior_other_employees true))
(assert (= other_employees_prohibition_18 false))
(assert (= violation_178_7 true))
(assert (= violation_178_1 false))
(assert (= violation_178_2 false))
(assert (= violation_178_4 false))
(assert (= violation_178_5 false))
(assert (= violation_178_6 false))
(assert (= violation_178_8 false))
(assert (= violation_178_9 false))
(assert (= violation_178_10 false))
(assert (= violation_178_11 false))
(assert (= violation_178_12 false))
(assert (= violation_mild false))
(assert (= improvement_ordered false))
(assert (= perform_or_agent_business_duties true))
(assert (= violation_177_1 false))
(assert (= violation_22_2_1_2 false))
(assert (= violation_14_related false))
(assert (= violation_14_4_related false))
(assert (= violation_14_6_related false))
(assert (= violation_25_1_related false))
(assert (= violation_26_2_related false))
(assert (= violation_26_3_related false))
(assert (= violation_28_2_related false))
(assert (= violation_36_1_related false))
(assert (= violation_43_related false))
(assert (= violation_foreign_178_3_4 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 26
; Total variables: 48
; Total facts: 45
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
