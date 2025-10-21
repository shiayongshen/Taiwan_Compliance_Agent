; SMT2 file generated from compliance case automatic
; Case ID: case_215
; Generated at: 2025-10-21T04:48:53.261998
;
; This file can be executed with Z3:
;   z3 case_215.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration_flag Bool)
(declare-const accelerated_deterioration_or_no_improvement Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_adequate Bool)
(declare-const capital_insufficient Bool)
(declare-const capital_level Int)
(declare-const capital_level_final Int)
(declare-const capital_severely_insufficient Bool)
(declare-const capital_severely_insufficient_penalty_condition Bool)
(declare-const capital_significantly_insufficient Bool)
(declare-const financial_business_deterioration_flag Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const hide_or_destroy_documents Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_approved_flag Bool)
(declare-const improvement_plan_completed Bool)
(declare-const improvement_plan_done Bool)
(declare-const late_or_false_report Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const no_response_or_false_response Bool)
(declare-const penalty Bool)
(declare-const refuse_inspection Bool)
(declare-const regulatory_action_required Bool)
(declare-const related_enterprise_report_failure Bool)
(declare-const violation_148_1_or_2 Bool)
(declare-const violation_148_1_or_2_flag Bool)
(declare-const violation_148_2_1 Bool)
(declare-const violation_148_2_1_flag Bool)
(declare-const violation_148_2_2 Bool)
(declare-const violation_148_2_2_flag Bool)
(declare-const violation_148_3_1 Bool)
(declare-const violation_148_3_1_flag Bool)
(declare-const violation_148_3_2 Bool)
(declare-const violation_148_3_2_flag Bool)
(declare-const violation_hide_or_destroy_documents Bool)
(declare-const violation_late_or_false_report Bool)
(declare-const violation_no_response_or_false_response Bool)
(declare-const violation_refuse_inspection Bool)
(declare-const violation_related_enterprise_report Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=資本適足, 2=資本不足, 3=資本顯著不足, 4=資本嚴重不足, 0=未分類）
(assert (let ((a!1 (or (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio)))
               (and (not (<= 3.0 net_worth_ratio)) (<= 2.0 net_worth_ratio)))))
(let ((a!2 (ite a!1
                2
                (ite (and (<= 200.0 capital_adequacy_ratio)
                          (<= 3.0 net_worth_ratio))
                     1
                     0))))
(let ((a!3 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                a!2)))
(let ((a!4 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!3)))
  (= capital_level a!4))))))

; [insurance:capital_level_final] 資本等級最終判定，若同時符合多等級，取較低等級
(assert (let ((a!1 (ite (= 3 capital_level)
                3
                (ite (= 2 capital_level) 2 (ite (= 1 capital_level) 1 0)))))
  (= capital_level_final (ite (= 4 capital_level) 4 a!1))))

; [insurance:capital_adequate] 資本適足判定
(assert (= capital_adequate (= 1 capital_level_final)))

; [insurance:capital_insufficient] 資本不足判定
(assert (= capital_insufficient (= 2 capital_level_final)))

; [insurance:capital_significantly_insufficient] 資本顯著不足判定
(assert (= capital_significantly_insufficient (= 3 capital_level_final)))

; [insurance:capital_severely_insufficient] 資本嚴重不足判定
(assert (= capital_severely_insufficient (= 4 capital_level_final)))

; [insurance:improvement_plan_completed] 增資、財務或業務改善計畫或合併於主管機關規定期限內完成
(assert (= improvement_plan_completed improvement_plan_done))

; [insurance:capital_severely_insufficient_penalty_condition] 資本嚴重不足且未於期限完成增資、改善計畫或合併
(assert (= capital_severely_insufficient_penalty_condition
   (and capital_severely_insufficient (not improvement_plan_completed))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration financial_business_deterioration_flag))

; [insurance:improvement_plan_approved] 主管機關核定財務或業務改善計畫
(assert (= improvement_plan_approved improvement_plan_approved_flag))

; [insurance:accelerated_deterioration_or_no_improvement] 損益、淨值加速惡化或經輔導仍未改善
(assert (= accelerated_deterioration_or_no_improvement accelerated_deterioration_flag))

; [insurance:regulatory_action_required] 應為監管、接管、勒令停業清理或命令解散之處分
(assert (= regulatory_action_required
   (or capital_severely_insufficient_penalty_condition
       (and financial_or_business_deterioration
            improvement_plan_approved
            accelerated_deterioration_or_no_improvement))))

; [insurance:violation_refuse_inspection] 拒絕檢查或拒絕開啟金庫或其他庫房
(assert (= violation_refuse_inspection refuse_inspection))

; [insurance:violation_hide_or_destroy_documents] 隱匿或毀損有關業務或財務狀況之帳冊文件
(assert (= violation_hide_or_destroy_documents hide_or_destroy_documents))

; [insurance:violation_no_response_or_false_response] 無故對檢查人員之詢問不為答復或答復不實
(assert (= violation_no_response_or_false_response no_response_or_false_response))

; [insurance:violation_late_or_false_report] 逾期提報財務報告、財產目錄或其他有關資料及報告，或提報不實、不全或未於規定期限內繳納查核費用
(assert (= violation_late_or_false_report late_or_false_report))

; [insurance:violation_related_enterprise_report] 關係企業或其他金融機構怠於提供財務報告、帳冊、文件或相關交易資料
(assert (= violation_related_enterprise_report related_enterprise_report_failure))

; [insurance:violation_148_1_or_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violation_148_1_or_2 violation_148_1_or_2_flag))

; [insurance:violation_148_2_1] 違反第一百四十八條之二第一項規定，未提供說明文件或說明文件不實
(assert (= violation_148_2_1 violation_148_2_1_flag))

; [insurance:violation_148_2_2] 違反第一百四十八條之二第二項規定，未依限報告或報告不實
(assert (= violation_148_2_2 violation_148_2_2_flag))

; [insurance:violation_148_3_1] 違反第一百四十八條之三第一項規定，未建立或未執行內部控制或稽核制度
(assert (= violation_148_3_1 violation_148_3_1_flag))

; [insurance:violation_148_3_2] 違反第一百四十八條之三第二項規定，未建立或未執行內部處理制度或程序
(assert (= violation_148_3_2 violation_148_3_2_flag))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一保險法相關規定時處罰
(assert (= penalty
   (or violation_148_3_1
       violation_hide_or_destroy_documents
       violation_148_2_2
       violation_late_or_false_report
       violation_related_enterprise_report
       violation_148_2_1
       violation_148_3_2
       violation_148_1_or_2
       violation_refuse_inspection
       violation_no_response_or_false_response
       capital_severely_insufficient_penalty_condition)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 50.0))
(assert (= net_worth_ratio 5.0))
(assert (= hide_or_destroy_documents true))
(assert (= violation_hide_or_destroy_documents true))
(assert (= violation_148_3_1_flag true))
(assert (= violation_148_3_1 true))
(assert (= penalty true))
(assert (= refuse_inspection false))
(assert (= violation_refuse_inspection false))
(assert (= no_response_or_false_response false))
(assert (= violation_no_response_or_false_response false))
(assert (= late_or_false_report false))
(assert (= violation_late_or_false_report false))
(assert (= related_enterprise_report_failure false))
(assert (= violation_related_enterprise_report false))
(assert (= violation_148_1_or_2_flag false))
(assert (= violation_148_1_or_2 false))
(assert (= violation_148_2_1_flag false))
(assert (= violation_148_2_1 false))
(assert (= violation_148_2_2_flag false))
(assert (= violation_148_2_2 false))
(assert (= violation_148_3_2_flag false))
(assert (= violation_148_3_2 false))
(assert (= capital_level 1))
(assert (= capital_level_final 1))
(assert (= capital_adequate true))
(assert (= capital_insufficient false))
(assert (= capital_significantly_insufficient false))
(assert (= capital_severely_insufficient false))
(assert (= capital_severely_insufficient_penalty_condition false))
(assert (= improvement_plan_done false))
(assert (= improvement_plan_completed false))
(assert (= improvement_plan_approved_flag false))
(assert (= improvement_plan_approved false))
(assert (= financial_business_deterioration_flag false))
(assert (= financial_or_business_deterioration false))
(assert (= accelerated_deterioration_flag false))
(assert (= accelerated_deterioration_or_no_improvement false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 24
; Total variables: 40
; Total facts: 39
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
