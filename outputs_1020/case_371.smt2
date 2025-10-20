; SMT2 file generated from compliance case automatic
; Case ID: case_371
; Generated at: 2025-10-19T14:18:31.732108
;
; This file can be executed with Z3:
;   z3 case_371.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const cannot_fulfill_contract Bool)
(declare-const cannot_pay_debt Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_2_measures_executed Bool)
(declare-const capital_level_3_measures_executed Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const capital_level_4_penalty Bool)
(declare-const capital_level_4_penalty_enforced Bool)
(declare-const capital_level_adequate Bool)
(declare-const capital_level_insufficient Bool)
(declare-const capital_level_severe_insufficient Bool)
(declare-const capital_level_significant_deterioration Bool)
(declare-const capital_plan_completed Bool)
(declare-const capital_plan_completed_flag Bool)
(declare-const compliance_documents_submitted Bool)
(declare-const days_after_deadline Int)
(declare-const derivative_trading_application_submitted Bool)
(declare-const derivative_trading_approval Bool)
(declare-const derivative_trading_compliance Bool)
(declare-const derivative_trading_procedure_approved Bool)
(declare-const derivative_trading_procedure_board_approved Bool)
(declare-const financial_deterioration Bool)
(declare-const funds_usage_limit_compliance Bool)
(declare-const funds_usage_within_limits Bool)
(declare-const improper_capital_measures Bool)
(declare-const improvement_plan_accelerated_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_not_effective Bool)
(declare-const improvement_plan_required Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const internal_audit_compliance Bool)
(declare-const internal_audit_system_established Bool)
(declare-const internal_audit_system_executed Bool)
(declare-const internal_control_and_handling_compliance Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_compliance Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const level_3_measures_executed Bool)
(declare-const level_4_measures_executed Bool)
(declare-const loan_approval_board_passed Bool)
(declare-const loan_approval_violation Bool)
(declare-const loan_guarantee_illegal Bool)
(declare-const loan_guarantee_no_full_collateral Bool)
(declare-const loan_limit_violated Bool)
(declare-const loan_or_transaction_limit_violated Bool)
(declare-const loan_or_transaction_limit_violation Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const profit_loss_accelerated_deterioration Bool)
(declare-const related_party_transaction_limit_compliance Bool)
(declare-const related_party_transaction_within_limits Bool)
(declare-const risk_to_insured Bool)
(declare-const self_audit_system_established Bool)
(declare-const self_audit_system_executed Bool)
(declare-const supervisory_measures_authorized Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level_severe_insufficient] 資本等級嚴重不足判定
(assert (= capital_level_severe_insufficient
   (or (not (<= 50.0 capital_adequacy_ratio)) (not (<= 0.0 net_worth)))))

; [insurance:capital_level_significant_deterioration] 資本等級顯著惡化判定
(assert (= capital_level_significant_deterioration
   (and (<= 50.0 capital_adequacy_ratio)
        (not (<= 150.0 capital_adequacy_ratio))
        (<= 0.0 net_worth_ratio)
        (not (<= 2.0 net_worth_ratio)))))

; [insurance:capital_level_insufficient] 資本等級不足判定
(assert (= capital_level_insufficient
   (and (<= 150.0 capital_adequacy_ratio)
        (not (<= 200.0 capital_adequacy_ratio)))))

; [insurance:capital_level_adequate] 資本等級適足判定
(assert (= capital_level_adequate (<= 200.0 capital_adequacy_ratio)))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著惡化, 4=嚴重不足, 0=未分類）
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
(let ((a!3 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級措施已執行
(assert (= capital_level_4_measures_executed level_4_measures_executed))

; [insurance:capital_level_3_measures_executed] 資本顯著惡化等級措施已執行
(assert (= capital_level_3_measures_executed level_3_measures_executed))

; [insurance:capital_level_2_measures_executed] 資本不足等級措施已執行
(assert (= capital_level_2_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:improper_capital_measures] 資本不足等級未執行對應措施
(assert (= improper_capital_measures
   (or (and (= 4 capital_level) (not capital_level_4_measures_executed))
       (and (= 2 capital_level) (not capital_level_2_measures_executed))
       (and (= 3 capital_level) (not capital_level_3_measures_executed)))))

; [insurance:improper_capital_measures_penalty] 資本不足且未執行對應措施時處罰
(assert (= penalty improper_capital_measures))

; [insurance:improper_capital_measures_penalty] 資本不足且未執行對應措施時處罰
(assert (= penalty improper_capital_measures))

; [insurance:capital_level_4_penalty] 資本嚴重不足且未完成增資、改善計畫或合併
(assert (= capital_level_4_penalty
   (and (= 4 capital_level)
        (not capital_level_4_measures_executed)
        (not capital_plan_completed))))

; [insurance:capital_level_4_penalty_enforced] 資本嚴重不足且未完成增資、改善計畫或合併，主管機關可接管、勒令停業清理或解散
(assert (= capital_level_4_penalty_enforced
   (and (= 4 capital_level)
        (not capital_plan_completed)
        (<= 0 days_after_deadline)
        (>= 90 days_after_deadline))))

; [insurance:financial_deterioration] 財務或業務狀況顯著惡化且不能支付債務或有損及被保險人權益之虞
(assert (= financial_deterioration
   (or cannot_pay_debt cannot_fulfill_contract risk_to_insured)))

; [insurance:improvement_plan_required] 主管機關要求提出財務或業務改善計畫並核定
(assert (= improvement_plan_required
   (and financial_deterioration improvement_plan_approved)))

; [insurance:improvement_plan_accelerated_deterioration] 損益、淨值加速惡化或經輔導仍未改善
(assert (= improvement_plan_accelerated_deterioration
   (or profit_loss_accelerated_deterioration improvement_plan_not_effective)))

; [insurance:supervisory_measures_authorized] 主管機關得依情節輕重為監管、接管、勒令停業清理或命令解散
(assert (= supervisory_measures_authorized
   (or capital_level_4_penalty_enforced
       (and financial_deterioration
            improvement_plan_approved
            improvement_plan_accelerated_deterioration))))

; [insurance:supervisory_measures_penalty] 違反資本嚴重不足且未完成增資改善計畫或財務狀況惡化未改善者，主管機關得為監管處分
(assert (= penalty supervisory_measures_authorized))

; [insurance:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [insurance:internal_control_executed] 執行內部控制及稽核制度
(assert (= internal_control_executed internal_control_system_executed))

; [insurance:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [insurance:internal_handling_executed] 執行內部處理制度及程序
(assert (= internal_handling_executed internal_handling_system_executed))

; [insurance:internal_control_compliance] 內部控制及稽核制度建立且執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_compliance] 內部處理制度及程序建立且執行
(assert (= internal_handling_compliance
   (and internal_handling_established internal_handling_executed)))

; [insurance:internal_control_and_handling_compliance] 內部控制及稽核制度與內部處理制度均合規
(assert (= internal_control_and_handling_compliance
   (and internal_control_compliance internal_handling_compliance)))

; [insurance:internal_control_and_handling_penalty] 未建立或未執行內部控制或內部處理制度時處罰
(assert (= penalty
   (or (not internal_control_compliance) (not internal_handling_compliance))))

; [insurance:funds_usage_limit_compliance] 保險業資金運用符合規定限制
(assert (= funds_usage_limit_compliance funds_usage_within_limits))

; [insurance:funds_usage_penalty] 資金運用違反規定時處罰或解除負責人職務
(assert (not (= funds_usage_limit_compliance penalty)))

; [insurance:loan_guarantee_illegal] 放款無十足擔保或條件優於其他同類放款
(assert (= loan_guarantee_illegal loan_guarantee_no_full_collateral))

; [insurance:loan_guarantee_penalty] 放款無十足擔保或條件優於其他同類放款者，負責人處罰
(assert (= penalty loan_guarantee_illegal))

; [insurance:loan_approval_violation] 擔保放款未經董事會三分之二出席及四分之三同意或違反放款限額規定
(assert (= loan_approval_violation
   (or (not loan_approval_board_passed) loan_limit_violated)))

; [insurance:loan_approval_penalty] 違反擔保放款董事會決議或限額規定者，負責人處罰
(assert (= penalty loan_approval_violation))

; [insurance:loan_or_transaction_limit_violation] 違反放款或其他交易限額或決議程序規定
(assert (= loan_or_transaction_limit_violation loan_or_transaction_limit_violated))

; [insurance:loan_or_transaction_limit_penalty] 違反放款或其他交易限額或決議程序規定者處罰
(assert (= penalty loan_or_transaction_limit_violation))

; [insurance:derivative_trading_approval] 衍生性金融商品交易已申請核准並備查相關文件
(assert (= derivative_trading_approval
   (and derivative_trading_application_submitted compliance_documents_submitted)))

; [insurance:derivative_trading_procedure_approved] 衍生性金融商品交易處理程序經董（理）事會通過
(assert (= derivative_trading_procedure_approved
   derivative_trading_procedure_board_approved))

; [insurance:derivative_trading_compliance] 衍生性金融商品交易符合申請及程序規定
(assert (= derivative_trading_compliance
   (and derivative_trading_approval derivative_trading_procedure_approved)))

; [insurance:derivative_trading_penalty] 未依規定申請核准或未經董（理）事會通過衍生性金融商品交易處理程序者處罰
(assert (not (= derivative_trading_compliance penalty)))

; [insurance:related_party_transaction_limit_compliance] 對同一人、同一關係人或同一關係企業之放款及其他交易符合限額規定
(assert (= related_party_transaction_limit_compliance
   related_party_transaction_within_limits))

; [insurance:related_party_transaction_penalty] 違反同一人、同一關係人或同一關係企業交易限額規定者處罰
(assert (not (= related_party_transaction_limit_compliance penalty)))

; [insurance:internal_audit_system_established] 建立自行查核制度
(assert (= internal_audit_system_established self_audit_system_established))

; [insurance:internal_audit_system_executed] 執行自行查核制度
(assert (= internal_audit_system_executed self_audit_system_executed))

; [insurance:internal_audit_compliance] 自行查核制度建立且執行
(assert (= internal_audit_compliance
   (and internal_audit_system_established internal_audit_system_executed)))

; [insurance:internal_audit_penalty] 未建立或未執行自行查核制度時處罰
(assert (not (= internal_audit_compliance penalty)))

; [insurance:compliance_with_law_adherence_plan] 依主管機關規定期限完成增資、財務或業務改善計畫或合併
(assert (= capital_plan_completed capital_plan_completed_flag))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反資本嚴重不足未完成增資改善計畫或財務狀況惡化未改善，或未建立執行內部控制及稽核制度、內部處理制度者處罰
(assert (= penalty
   (or (and financial_deterioration
            improvement_plan_approved
            improvement_plan_accelerated_deterioration)
       (not internal_handling_compliance)
       (and (= 4 capital_level)
            (not capital_plan_completed)
            (<= 0 days_after_deadline)
            (>= 90 days_after_deadline))
       (not internal_control_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= derivative_trading_application_submitted false))
(assert (= compliance_documents_submitted false))
(assert (= derivative_trading_procedure_board_approved false))
(assert (= loan_or_transaction_limit_violated true))
(assert (= related_party_transaction_within_limits false))
(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= self_audit_system_established false))
(assert (= self_audit_system_executed false))
(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 1000000.0))
(assert (= net_worth_ratio 10.0))
(assert (= cannot_pay_debt false))
(assert (= cannot_fulfill_contract false))
(assert (= risk_to_insured false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_not_effective false))
(assert (= profit_loss_accelerated_deterioration false))
(assert (= financial_deterioration false))
(assert (= capital_plan_completed false))
(assert (= capital_plan_completed_flag false))
(assert (= days_after_deadline 0))
(assert (= level_3_measures_executed false))
(assert (= level_4_measures_executed false))
(assert (= loan_approval_board_passed true))
(assert (= loan_guarantee_no_full_collateral false))
(assert (= funds_usage_within_limits false))
(assert (= derivative_trading_approval false))
(assert (= derivative_trading_procedure_approved false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_control_compliance false))
(assert (= internal_handling_compliance false))
(assert (= internal_control_and_handling_compliance false))
(assert (= internal_audit_system_established false))
(assert (= internal_audit_system_executed false))
(assert (= internal_audit_compliance false))
(assert (= loan_or_transaction_limit_violation true))
(assert (= related_party_transaction_limit_compliance false))
(assert (= loan_approval_violation false))
(assert (= loan_guarantee_illegal false))
(assert (= capital_level 0))
(assert (= capital_level_2_measures_executed false))
(assert (= capital_level_3_measures_executed false))
(assert (= capital_level_4_measures_executed false))
(assert (= capital_level_4_penalty false))
(assert (= capital_level_4_penalty_enforced false))
(assert (= capital_level_adequate false))
(assert (= capital_level_insufficient false))
(assert (= capital_level_severe_insufficient false))
(assert (= capital_level_significant_deterioration false))
(assert (= derivative_trading_compliance false))
(assert (= funds_usage_limit_compliance false))
(assert (= improper_capital_measures false))
(assert (= improvement_plan_accelerated_deterioration false))
(assert (= improvement_plan_required false))
(assert (= loan_limit_violated false))
(assert (= penalty false))
(assert (= supervisory_measures_authorized false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 47
; Total variables: 65
; Total facts: 65
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
