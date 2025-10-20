; SMT2 file generated from compliance case automatic
; Case ID: case_347
; Generated at: 2025-10-19T13:43:37.012442
;
; This file can be executed with Z3:
;   z3 case_347.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration_or_no_improvement Bool)
(declare-const business_improvement_plan_completed Bool)
(declare-const cannot_fulfill_contract Bool)
(declare-const cannot_pay_debt Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_insufficient_measures_submitted Bool)
(declare-const capital_insufficient_measures_within_90_days Bool)
(declare-const capital_level Int)
(declare-const contract_or_major_commitment_without_approval Bool)
(declare-const days_since_deadline Int)
(declare-const exceed_payment_limit Bool)
(declare-const financial_improvement_plan_completed Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_approved Bool)
(declare-const internal_control_and_audit_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_ok Bool)
(declare-const merger_completed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const other_major_financial_impact Bool)
(declare-const payment_limit Real)
(declare-const penalty Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const supervision_payment_limit Real)
(declare-const supervisory_measures_required Bool)
(declare-const supervisory_restrictions Bool)
(declare-const under_supervision Bool)
(declare-const violate_article_143 Bool)
(declare-const violate_article_143_5_or_143_6 Bool)
(declare-const violate_business_scope_rule Bool)
(declare-const violate_disclosure_document_rule Bool)
(declare-const violate_fund_usage_rule Bool)
(declare-const violate_loan_approval_rule Bool)
(declare-const violate_loan_guarantee_rule Bool)
(declare-const violate_loan_limit_or_resolution_rule Bool)
(declare-const violate_report_or_public_disclosure_rule Bool)
(declare-const violate_reserve_rule Bool)
(declare-const violation_article_143 Bool)
(declare-const violation_article_143_5_or_143_6_measures Bool)
(declare-const violation_business_scope Bool)
(declare-const violation_disclosure_document Bool)
(declare-const violation_fund_usage Bool)
(declare-const violation_loan_approval Bool)
(declare-const violation_loan_guarantee Bool)
(declare-const violation_loan_limit_or_resolution Bool)
(declare-const violation_report_or_public_disclosure Bool)
(declare-const violation_reserve_rules Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
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

; [insurance:capital_insufficient_measures_submitted] 資本嚴重不足且未依主管機關規定期限完成增資、財務或業務改善計畫或合併
(assert (= capital_insufficient_measures_submitted
   (and (= 4 capital_level)
        (not (or financial_improvement_plan_completed
                 capital_increase_completed
                 business_improvement_plan_completed
                 merger_completed)))))

; [insurance:capital_insufficient_measures_within_90_days] 資本嚴重不足且未於期限屆滿次日起九十日內完成增資、改善計畫或合併
(assert (= capital_insufficient_measures_within_90_days
   (and (= 4 capital_level)
        (not capital_insufficient_measures_submitted)
        (>= 90 days_since_deadline))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或無法履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or cannot_pay_debt cannot_fulfill_contract risk_to_insured_rights)))

; [insurance:improvement_plan_submitted_and_approved] 已提出財務或業務改善計畫並經主管機關核定
(assert (= improvement_plan_submitted_and_approved
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:accelerated_deterioration_or_no_improvement] 損益、淨值加速惡化或經輔導仍未改善，致仍有財務或業務惡化之虞
(assert (= accelerated_deterioration_or_no_improvement
   (or profit_loss_accelerated_deterioration
       (and improvement_plan_submitted_and_approved
            (not improvement_plan_executed)))))

; [insurance:supervisory_measures_required] 應依情節輕重為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_required
   (or capital_insufficient_measures_within_90_days
       (and (not capital_insufficient_measures_within_90_days)
            financial_or_business_deterioration
            improvement_plan_submitted_and_approved
            accelerated_deterioration_or_no_improvement))))

; [insurance:supervisory_restrictions] 監管處分限制保險業行為
(assert (= supervisory_restrictions
   (and under_supervision
        (<= payment_limit supervision_payment_limit)
        (not exceed_payment_limit)
        (not contract_or_major_commitment_without_approval)
        (not other_major_financial_impact))))

; [insurance:internal_control_and_audit_ok] 建立並執行內部控制及稽核制度
(assert (= internal_control_and_audit_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 建立並執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:internal_operation_ok] 建立並執行內部作業制度及程序
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [insurance:violation_business_scope] 違反業務範圍規定
(assert (= violation_business_scope violate_business_scope_rule))

; [insurance:violation_reserve_rules] 違反賠償準備金提存額度或提存方式規定
(assert (= violation_reserve_rules violate_reserve_rule))

; [insurance:violation_article_143] 違反保險法第143條規定
(assert (= violation_article_143 violate_article_143))

; [insurance:violation_article_143_5_or_143_6_measures] 違反第143條之五或主管機關依第143條之六規定所為措施
(assert (= violation_article_143_5_or_143_6_measures violate_article_143_5_or_143_6))

; [insurance:violation_fund_usage] 資金運用違反相關規定
(assert (= violation_fund_usage violate_fund_usage_rule))

; [insurance:violation_loan_guarantee] 違反放款無十足擔保或條件優於其他同類放款規定
(assert (= violation_loan_guarantee violate_loan_guarantee_rule))

; [insurance:violation_loan_approval] 違反放款董事會同意或限額規定
(assert (= violation_loan_approval violate_loan_approval_rule))

; [insurance:violation_loan_limit_or_resolution] 違反放款或其他交易限額及決議程序規定
(assert (= violation_loan_limit_or_resolution violate_loan_limit_or_resolution_rule))

; [insurance:violation_disclosure_document] 未提供或提供不實說明文件
(assert (= violation_disclosure_document violate_disclosure_document_rule))

; [insurance:violation_report_or_public_disclosure] 未依限報告或公開說明，或內容不實
(assert (= violation_report_or_public_disclosure
   violate_report_or_public_disclosure_rule))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反資本嚴重不足增資或改善計畫、違反業務範圍、準備金提存、內部控制、資金運用等規定時處罰
(assert (= penalty
   (or violation_article_143_5_or_143_6_measures
       (not internal_operation_ok)
       violation_disclosure_document
       violation_report_or_public_disclosure
       (not internal_control_and_audit_ok)
       violation_article_143
       violation_loan_limit_or_resolution
       violation_fund_usage
       (not internal_handling_ok)
       violation_loan_approval
       violation_reserve_rules
       violation_loan_guarantee
       violation_business_scope
       (and (= 4 capital_level) (not capital_insufficient_measures_submitted)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= capital_increase_completed false))
(assert (= financial_improvement_plan_completed false))
(assert (= business_improvement_plan_completed false))
(assert (= merger_completed false))
(assert (= capital_insufficient_measures_submitted false))
(assert (= capital_insufficient_measures_within_90_days false))
(assert (= days_since_deadline 0))
(assert (= cannot_pay_debt false))
(assert (= cannot_fulfill_contract false))
(assert (= risk_to_insured_rights false))
(assert (= financial_or_business_deterioration false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_executed false))
(assert (= improvement_plan_submitted_and_approved false))
(assert (= accelerated_deterioration_or_no_improvement false))
(assert (= under_supervision false))
(assert (= payment_limit 168.0))
(assert (= supervision_payment_limit 168.0))
(assert (= exceed_payment_limit false))
(assert (= contract_or_major_commitment_without_approval false))
(assert (= other_major_financial_impact false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_and_audit_ok false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_handling_ok false))
(assert (= internal_operation_established false))
(assert (= internal_operation_executed false))
(assert (= internal_operation_ok false))
(assert (= violate_business_scope_rule false))
(assert (= violation_business_scope false))
(assert (= violate_reserve_rule false))
(assert (= violation_reserve_rules false))
(assert (= violate_article_143 false))
(assert (= violation_article_143 false))
(assert (= violate_article_143_5_or_143_6 false))
(assert (= violation_article_143_5_or_143_6_measures false))
(assert (= violate_fund_usage_rule true))
(assert (= violation_fund_usage true))
(assert (= violate_loan_guarantee_rule false))
(assert (= violation_loan_guarantee false))
(assert (= violate_loan_approval_rule false))
(assert (= violation_loan_approval false))
(assert (= violate_loan_limit_or_resolution_rule false))
(assert (= violation_loan_limit_or_resolution false))
(assert (= violate_disclosure_document_rule false))
(assert (= violation_disclosure_document false))
(assert (= violate_report_or_public_disclosure_rule false))
(assert (= violation_report_or_public_disclosure false))
(assert (= penalty true))
(assert (= capital_level 0))
(assert (= profit_loss_accelerated_deterioration false))
(assert (= supervisory_measures_required false))
(assert (= supervisory_restrictions false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 23
; Total variables: 59
; Total facts: 59
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
