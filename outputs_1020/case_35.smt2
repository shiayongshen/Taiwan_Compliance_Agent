; SMT2 file generated from compliance case automatic
; Case ID: case_35
; Generated at: 2025-10-19T06:05:26.511663
;
; This file can be executed with Z3:
;   z3 case_35.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio_6m_min Real)
(declare-const contract_data_retained Bool)
(declare-const contract_language_chinese Bool)
(declare-const contract_page_numbered Bool)
(declare-const contract_written Bool)
(declare-const derivative_trading_allowed Bool)
(declare-const derivative_trading_contract_compliance Bool)
(declare-const derivative_trading_qualification Bool)
(declare-const derivative_trading_qualification_exception Bool)
(declare-const disclosure_accurate Bool)
(declare-const disclosure_date_marked Bool)
(declare-const disclosure_fair Bool)
(declare-const document_compliance Bool)
(declare-const documents_properly_handled Bool)
(declare-const financial_business_compliance Bool)
(declare-const financial_business_rules_followed Bool)
(declare-const financial_status_compliant Bool)
(declare-const improvement_completed Bool)
(declare-const improvement_recognized Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_executed Bool)
(declare-const license_revoked_last_2y Bool)
(declare-const net_worth Real)
(declare-const paid_in_capital Real)
(declare-const penalty Bool)
(declare-const penalty_applicable Bool)
(declare-const punished_last_3m_type1 Bool)
(declare-const punished_last_6m_type2 Bool)
(declare-const report_submission_compliance Bool)
(declare-const report_submitted_on_time Bool)
(declare-const required_ratio Real)
(declare-const securities_broker_all_businesses Bool)
(declare-const suspended_last_1y Bool)
(declare-const trading_restricted_last_1y Bool)
(declare-const violation_dismissal_ordered Bool)
(declare-const violation_license_revoked Bool)
(declare-const violation_minor Bool)
(declare-const violation_other_measures Bool)
(declare-const violation_penalty_level Int)
(declare-const violation_suspension_ordered Bool)
(declare-const violation_warning Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_penalty] 證券商違反法令或命令之處分等級分類（1=警告, 2=解除職務, 3=停業, 4=撤銷營業許可, 5=其他處置）
(assert (let ((a!1 (ite violation_dismissal_ordered
                2
                (ite violation_suspension_ordered
                     3
                     (ite violation_license_revoked
                          4
                          (ite violation_other_measures 5 0))))))
  (= violation_penalty_level (ite violation_warning 1 a!1))))

; [securities:internal_control_compliance] 證券商或相關事業確實執行內部控制制度
(assert (= internal_control_compliance internal_control_executed))

; [securities:report_submission_compliance] 依主管機關命令提出帳簿、表冊、文件或其他資料
(assert (= report_submission_compliance report_submitted_on_time))

; [securities:document_compliance] 依規定製作、申報、公告、備置或保存帳簿、表冊、傳票、財務報告或其他文件
(assert (= document_compliance documents_properly_handled))

; [securities:financial_business_compliance] 證券商或相關事業遵守財務、業務或管理規定
(assert (= financial_business_compliance financial_business_rules_followed))

; [securities:penalty_applicable] 違反證券交易法相關規定且未改善者處罰
(assert (= penalty_applicable
   (and (not violation_minor)
        (not improvement_completed)
        (or (not report_submission_compliance)
            (not document_compliance)
            (not internal_control_compliance)
            (not financial_business_compliance)))))

; [securities:derivative_trading_qualification] 證券商符合衍生性金融商品交易業務資格條件
(assert (= derivative_trading_qualification
   (and securities_broker_all_businesses
        (>= net_worth paid_in_capital)
        financial_status_compliant
        (>= capital_adequacy_ratio_6m_min required_ratio)
        (not (or license_revoked_last_2y
                 suspended_last_1y
                 trading_restricted_last_1y
                 punished_last_3m_type1
                 punished_last_6m_type2)))))

; [securities:derivative_trading_qualification_exception] 證券商不符限制條件但已具體改善且經認可者可免受限制
(assert (= derivative_trading_qualification_exception
   (and (not derivative_trading_qualification) improvement_recognized)))

; [securities:derivative_trading_allowed] 證券商可經營衍生性金融商品交易業務
(assert (= derivative_trading_allowed
   (or derivative_trading_qualification
       derivative_trading_qualification_exception)))

; [securities:derivative_trading_contract_compliance] 證券商與客戶簽訂書面契約並充分說明交易重要內容及揭露風險
(assert (= derivative_trading_contract_compliance
   (and contract_written
        disclosure_accurate
        disclosure_fair
        disclosure_date_marked
        contract_language_chinese
        contract_page_numbered
        contract_data_retained)))

; [securities:penalty_default_false] 預設不處罰
(assert (not penalty))

; [securities:penalty_conditions] 處罰條件：違反法令且未改善或未完成改善者處罰
(assert (= penalty
   (and (not violation_minor)
        (not improvement_completed)
        (or (not report_submission_compliance)
            (not financial_business_compliance)
            (not internal_control_compliance)
            (not document_compliance)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_warning true))
(assert (= violation_dismissal_ordered false))
(assert (= violation_suspension_ordered false))
(assert (= violation_license_revoked false))
(assert (= violation_other_measures false))
(assert (= internal_control_executed false))
(assert (= report_submitted_on_time true))
(assert (= documents_properly_handled false))
(assert (= financial_business_rules_followed false))
(assert (= improvement_completed false))
(assert (= improvement_recognized false))
(assert (= violation_minor false))
(assert (= securities_broker_all_businesses true))
(assert (= net_worth 100.0))
(assert (= paid_in_capital 100.0))
(assert (= financial_status_compliant false))
(assert (= capital_adequacy_ratio_6m_min 0.0))
(assert (= punished_last_3m_type1 false))
(assert (= punished_last_6m_type2 false))
(assert (= suspended_last_1y false))
(assert (= license_revoked_last_2y false))
(assert (= trading_restricted_last_1y false))
(assert (= contract_written false))
(assert (= disclosure_accurate false))
(assert (= disclosure_fair false))
(assert (= disclosure_date_marked false))
(assert (= contract_language_chinese false))
(assert (= contract_page_numbered false))
(assert (= contract_data_retained false))
(assert (= derivative_trading_allowed false))
(assert (= derivative_trading_contract_compliance false))
(assert (= derivative_trading_qualification false))
(assert (= derivative_trading_qualification_exception false))
(assert (= document_compliance false))
(assert (= financial_business_compliance false))
(assert (= internal_control_compliance false))
(assert (= penalty false))
(assert (= penalty_applicable false))
(assert (= report_submission_compliance false))
(assert (= required_ratio 0.0))
(assert (= violation_penalty_level 0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 41
; Total facts: 41
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
