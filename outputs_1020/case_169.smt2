; SMT2 file generated from compliance case automatic
; Case ID: case_169
; Generated at: 2025-10-19T09:47:08.424190
;
; This file can be executed with Z3:
;   z3 case_169.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_report_reported Bool)
(declare-const annual_report_submitted Bool)
(declare-const business_report_prepared Bool)
(declare-const contract_terms_compliance Bool)
(declare-const contract_terms_level Int)
(declare-const cooperation_approval Bool)
(declare-const financial_report_audited Bool)
(declare-const full_bank_performance_guarantee_obtained Bool)
(declare-const funds_fully_trusted Bool)
(declare-const guarantee_contract_compliant Bool)
(declare-const guarantee_contract_meets_regulator_requirements Bool)
(declare-const internal_control_compliant Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_system_compliant Bool)
(declare-const internal_control_system_established Bool)
(declare-const penalty Bool)
(declare-const registration_and_payment_restriction Bool)
(declare-const regulator_approval_obtained Bool)
(declare-const regulator_minimum_level Int)
(declare-const renewal_or_new_contract_completed Bool)
(declare-const renewal_reported_to_regulator Bool)
(declare-const report_announced_publicly Bool)
(declare-const report_preparation_days_after_fiscal_year_end Int)
(declare-const report_submission_days_after_board_approval Int)
(declare-const report_submitted_to_regulator Bool)
(declare-const trust_contract_compliant Bool)
(declare-const trust_contract_meets_regulator_requirements Bool)
(declare-const trust_or_guarantee_compliance Bool)
(declare-const trust_or_guarantee_renewed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [e_payment:contract_terms_compliance] 電子支付機構業務定型化契約條款內容不得低於主管機關範本
(assert (= contract_terms_compliance (>= contract_terms_level regulator_minimum_level)))

; [e_payment:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [e_payment:internal_control_compliant] 內部控制制度符合主管機關定之辦法
(assert (= internal_control_compliant internal_control_system_compliant))

; [e_payment:annual_report_submitted] 會計年度終了四個月內編製營業報告書及財務報告
(assert (= annual_report_submitted
   (and business_report_prepared
        financial_report_audited
        (>= 15 report_submission_days_after_board_approval)
        (>= 120 report_preparation_days_after_fiscal_year_end))))

; [e_payment:annual_report_reported] 董事會通過翌日起十五日內向主管機關申報並公告
(assert (= annual_report_reported
   (and report_submitted_to_regulator report_announced_publicly)))

; [e_payment:cooperation_approval] 與境外機構合作須經主管機關核准
(assert (= cooperation_approval regulator_approval_obtained))

; [e_payment:trust_or_guarantee_compliance] 儲值款項扣除準備金餘額及代理收付款項全部交付信託或取得銀行十足履約保證
(assert (= trust_or_guarantee_compliance
   (or funds_fully_trusted full_bank_performance_guarantee_obtained)))

; [e_payment:trust_contract_compliant] 信託契約符合主管機關公告之應記載及不得記載事項
(assert (= trust_contract_compliant trust_contract_meets_regulator_requirements))

; [e_payment:guarantee_contract_compliant] 履約保證契約符合主管機關公告之應記載及不得記載事項
(assert (= guarantee_contract_compliant guarantee_contract_meets_regulator_requirements))

; [e_payment:trust_or_guarantee_renewed] 信託契約或履約保證契約到期日二個月前完成續約或訂定新契約並函報主管機關備查
(assert (= trust_or_guarantee_renewed
   (and renewal_or_new_contract_completed renewal_reported_to_regulator)))

; [e_payment:registration_and_payment_restriction] 未依規定辦理者不得受理新使用者註冊、簽訂特約機構及收受新增支付款項
(assert (not (= (and trust_or_guarantee_compliance
             trust_contract_compliant
             guarantee_contract_compliant
             trust_or_guarantee_renewed)
        registration_and_payment_restriction)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反合作核准、信託或履約保證規定或未依規定辦理者處罰
(assert (= penalty
   (or (not guarantee_contract_compliant)
       (not cooperation_approval)
       registration_and_payment_restriction
       (not trust_contract_compliant))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_compliant false))
(assert (= internal_control_established false))
(assert (= internal_control_compliant false))
(assert (= contract_terms_compliance true))
(assert (= contract_terms_level 1))
(assert (= cooperation_approval true))
(assert (= funds_fully_trusted true))
(assert (= full_bank_performance_guarantee_obtained false))
(assert (= trust_contract_meets_regulator_requirements true))
(assert (= trust_contract_compliant true))
(assert (= guarantee_contract_meets_regulator_requirements true))
(assert (= guarantee_contract_compliant true))
(assert (= renewal_or_new_contract_completed true))
(assert (= renewal_reported_to_regulator true))
(assert (= trust_or_guarantee_renewed true))
(assert (= registration_and_payment_restriction false))
(assert (= business_report_prepared true))
(assert (= financial_report_audited true))
(assert (= report_submission_days_after_board_approval 7))
(assert (= report_preparation_days_after_fiscal_year_end 7))
(assert (= report_submitted_to_regulator true))
(assert (= report_announced_publicly true))
(assert (= annual_report_submitted true))
(assert (= annual_report_reported true))
(assert (= regulator_approval_obtained true))
(assert (= penalty true))
(assert (= regulator_minimum_level 0))
(assert (= trust_or_guarantee_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 29
; Total facts: 29
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
