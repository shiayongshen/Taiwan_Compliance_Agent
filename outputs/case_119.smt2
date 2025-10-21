; SMT2 file generated from compliance case automatic
; Case ID: case_119
; Generated at: 2025-10-21T02:12:56.262684
;
; This file can be executed with Z3:
;   z3 case_119.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const cannot_fulfill_contract Bool)
(declare-const cannot_pay_debt Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_2_measures_completed Bool)
(declare-const capital_level_2_noncompliance Bool)
(declare-const capital_level_3_measures_completed Bool)
(declare-const capital_level_3_noncompliance Bool)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_4_noncompliance Bool)
(declare-const explanation_doc_false Bool)
(declare-const explanation_doc_not_compliant Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_failed Bool)
(declare-const improvement_plan_not_effective Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const internal_control_and_audit_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const interview_conducted Bool)
(declare-const interview_record_kept Bool)
(declare-const net_worth Real)
(declare-const net_worth_deteriorating Bool)
(declare-const net_worth_ratio Real)
(declare-const not_provide_explanation_doc Bool)
(declare-const not_public_explanation_in_time Bool)
(declare-const not_report_to_authority_in_time Bool)
(declare-const penalty Bool)
(declare-const phone_video_interview_compliance Bool)
(declare-const profit_loss_deteriorating Bool)
(declare-const recording_kept Bool)
(declare-const report_or_explanation_false Bool)
(declare-const review_confirmed Bool)
(declare-const risk_to_insured_interest Bool)
(declare-const sales_recording_compliance Bool)
(declare-const supervision_measures_required Bool)
(declare-const violation_148_1_2 Bool)
(declare-const violation_148_1_2_flag Bool)
(declare-const violation_148_2_1 Bool)
(declare-const violation_148_2_2 Bool)
(declare-const violation_148_3_1 Bool)
(declare-const violation_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violation_148_1_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violation_148_1_2 violation_148_1_2_flag))

; [insurance:violation_148_2_1] 違反第一百四十八條之二第一項規定，未提供說明文件或文件不實
(assert (= violation_148_2_1
   (or explanation_doc_false
       explanation_doc_not_compliant
       not_provide_explanation_doc)))

; [insurance:violation_148_2_2] 違反第一百四十八條之二第二項規定，未依限報告或公開說明或內容不實
(assert (= violation_148_2_2
   (or not_report_to_authority_in_time
       not_public_explanation_in_time
       report_or_explanation_false)))

; [insurance:violation_148_3_1] 違反第一百四十八條之三第一項規定，未建立或未執行內部控制或稽核制度
(assert (= violation_148_3_1
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violation_148_3_2] 違反第一百四十八條之三第二項規定，未建立或未執行內部處理制度或程序
(assert (= violation_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (<= 200.0 capital_adequacy_ratio) 1 0))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                a!1)))
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_4_noncompliance] 資本嚴重不足且未依主管機關規定期限完成增資、改善計畫或合併
(assert (= capital_level_4_noncompliance
   (and (= 4 capital_level) (not capital_level_4_measures_completed))))

; [insurance:capital_level_3_noncompliance] 資本顯著不足且未依主管機關規定期限完成增資、改善計畫或合併
(assert (= capital_level_3_noncompliance
   (and (= 3 capital_level) (not capital_level_3_measures_completed))))

; [insurance:capital_level_2_noncompliance] 資本不足且未依主管機關規定期限完成增資、改善計畫或合併
(assert (= capital_level_2_noncompliance
   (and (= 2 capital_level) (not capital_level_2_measures_completed))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or cannot_pay_debt risk_to_insured_interest cannot_fulfill_contract)))

; [insurance:improvement_plan_submitted_and_approved] 已提出財務或業務改善計畫並經主管機關核定
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:improvement_plan_not_effective] 損益、淨值加速惡化或經輔導仍未改善
(assert (= improvement_plan_not_effective
   (or net_worth_deteriorating
       improvement_plan_failed
       profit_loss_deteriorating)))

; [insurance:supervision_measures_required] 需監管、接管、勒令停業清理或命令解散之處分
(assert (= supervision_measures_required
   (or (and (= 4 capital_level) (not capital_level_4_measures_completed))
       (and (= 3 capital_level) (not capital_level_3_measures_completed))
       (and financial_or_business_deterioration
            improvement_plan_submitted_and_approved
            improvement_plan_not_effective)
       (and (= 2 capital_level) (not capital_level_2_measures_completed)))))

; [insurance:internal_control_and_audit_ok] 建立且執行內部控制及稽核制度
(assert (= internal_control_and_audit_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 建立且執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:sales_recording_compliance] 六十五歲以上客戶銷售過程錄音錄影或電子設備留存並覆審確認適當性
(assert (= sales_recording_compliance (and recording_kept review_confirmed)))

; [insurance:phone_video_interview_compliance] 指派非銷售通路人員於承保前進行訪問並保留紀錄
(assert (= phone_video_interview_compliance
   (and interview_conducted interview_record_kept)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一規定時處罰
(assert (= penalty
   (or violation_148_2_1
       violation_148_2_2
       (not phone_video_interview_compliance)
       (and financial_or_business_deterioration
            improvement_plan_submitted_and_approved
            improvement_plan_not_effective)
       (not internal_control_and_audit_ok)
       capital_level_2_noncompliance
       violation_148_3_1
       violation_148_1_2
       (not sales_recording_compliance)
       capital_level_3_noncompliance
       (not internal_handling_ok)
       capital_level_4_noncompliance
       violation_148_3_2)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_148_1_2_flag true))
(assert (= violation_148_1_2 true))
(assert (= violation_148_3_1 true))
(assert (= violation_148_3_2 true))
(assert (= not_report_to_authority_in_time true))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= not_provide_explanation_doc false))
(assert (= explanation_doc_not_compliant false))
(assert (= explanation_doc_false false))
(assert (= not_public_explanation_in_time false))
(assert (= report_or_explanation_false false))
(assert (= recording_kept false))
(assert (= review_confirmed false))
(assert (= sales_recording_compliance false))
(assert (= interview_conducted false))
(assert (= interview_record_kept false))
(assert (= phone_video_interview_compliance false))
(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth_ratio 3.0))
(assert (= net_worth 500.0))
(assert (= capital_level 1))
(assert (= capital_level_2_measures_completed true))
(assert (= capital_level_3_measures_completed true))
(assert (= capital_level_4_measures_completed true))
(assert (= capital_level_2_noncompliance false))
(assert (= capital_level_3_noncompliance false))
(assert (= capital_level_4_noncompliance false))
(assert (= cannot_pay_debt false))
(assert (= cannot_fulfill_contract false))
(assert (= risk_to_insured_interest true))
(assert (= financial_or_business_deterioration true))
(assert (= improvement_plan_submitted true))
(assert (= improvement_plan_approved true))
(assert (= improvement_plan_submitted_and_approved true))
(assert (= profit_loss_deteriorating true))
(assert (= net_worth_deteriorating true))
(assert (= improvement_plan_failed true))
(assert (= improvement_plan_not_effective true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 19
; Total variables: 47
; Total facts: 42
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
