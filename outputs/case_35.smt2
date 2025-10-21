; SMT2 file generated from compliance case automatic
; Case ID: case_35
; Generated at: 2025-10-20T23:34:44.207763
;
; This file can be executed with Z3:
;   z3 case_35.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const contract_written_and_risk_disclosed Bool)
(declare-const derivative_financial_contract_compliance Bool)
(declare-const derivative_financial_contract_important_content_compliance Bool)
(declare-const document_preparation_compliance Bool)
(declare-const documents_prepared_and_preserved Bool)
(declare-const important_content_compliant Bool)
(declare-const improvement_completed Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_executed Bool)
(declare-const minor_violation_exemption Bool)
(declare-const penalty Bool)
(declare-const penalty_applicable Bool)
(declare-const report_submission_compliance Bool)
(declare-const report_submitted_on_time Bool)
(declare-const violation_dismiss_officer Bool)
(declare-const violation_minor Bool)
(declare-const violation_occurred Bool)
(declare-const violation_other_measures Bool)
(declare-const violation_penalty_level Int)
(declare-const violation_revoke_license Bool)
(declare-const violation_suspension Bool)
(declare-const violation_warning Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_penalty_level] 證券商違反法令之處分等級（1=警告,2=解除職務,3=停業,4=撤銷營業許可,5=其他處置）
(assert (let ((a!1 (ite violation_dismiss_officer
                2
                (ite violation_suspension
                     3
                     (ite violation_revoke_license
                          4
                          (ite violation_other_measures 5 0))))))
  (= violation_penalty_level (ite violation_warning 1 a!1))))

; [securities:internal_control_compliance] 證券商內部控制制度確實執行
(assert (= internal_control_compliance internal_control_executed))

; [securities:report_submission_compliance] 依主管機關命令提出帳簿、表冊、文件或其他資料
(assert (= report_submission_compliance report_submitted_on_time))

; [securities:document_preparation_compliance] 依規定製作、申報、公告、備置或保存帳簿、表冊、傳票、財務報告或其他文件
(assert (= document_preparation_compliance documents_prepared_and_preserved))

; [securities:minor_violation_exemption] 違反行為情節輕微且已改善完成免予處罰
(assert (= minor_violation_exemption (and violation_minor improvement_completed)))

; [securities:penalty_applicable] 違反法令且未免予處罰者應處罰
(assert (= penalty_applicable (and violation_occurred (not minor_violation_exemption))))

; [securities:derivative_financial_contract_compliance] 衍生性金融商品交易書面契約充分說明重要內容及揭露風險
(assert (= derivative_financial_contract_compliance contract_written_and_risk_disclosed))

; [securities:derivative_financial_contract_important_content_compliance] 衍生性金融商品交易重要內容完整且以顯著方式表達
(assert (= derivative_financial_contract_important_content_compliance
   important_content_compliant))

; [securities:penalty_default_false] 預設不處罰
(assert (not penalty))

; [securities:penalty_conditions] 處罰條件：違反法令且未免予處罰時處罰
(assert (= penalty (and violation_occurred (not minor_violation_exemption))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_occurred true))
(assert (= violation_warning true))
(assert (= violation_dismiss_officer false))
(assert (= violation_suspension false))
(assert (= violation_revoke_license false))
(assert (= violation_other_measures false))
(assert (= violation_minor false))
(assert (= improvement_completed false))
(assert (= penalty_applicable true))
(assert (= penalty true))
(assert (= internal_control_executed false))
(assert (= internal_control_compliance false))
(assert (= report_submitted_on_time false))
(assert (= report_submission_compliance false))
(assert (= documents_prepared_and_preserved false))
(assert (= document_preparation_compliance false))
(assert (= contract_written_and_risk_disclosed false))
(assert (= derivative_financial_contract_compliance false))
(assert (= important_content_compliant false))
(assert (= derivative_financial_contract_important_content_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 22
; Total facts: 20
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
