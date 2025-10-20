; SMT2 file generated from compliance case automatic
; Case ID: case_211
; Generated at: 2025-10-19T10:35:11.984096
;
; This file can be executed with Z3:
;   z3 case_211.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const asset_transaction_amount Real)
(declare-const asset_transaction_compliance Bool)
(declare-const asset_transaction_exclusion Bool)
(declare-const asset_transaction_must_report Bool)
(declare-const asset_transaction_reporting_required Bool)
(declare-const asset_transaction_shareholder_meeting_required Bool)
(declare-const bank_subsidiary_all_related_parties_limit_ok Bool)
(declare-const bank_subsidiary_all_related_parties_transaction_amount Real)
(declare-const bank_subsidiary_net_worth Real)
(declare-const bank_subsidiary_single_related_party_limit_ok Bool)
(declare-const bank_subsidiary_single_related_party_transaction_amount Real)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const board_member_recusal Bool)
(declare-const board_member_recusal_compliance Bool)
(declare-const insurance_owner_equity Real)
(declare-const internal_operating_rules_established Bool)
(declare-const is_fhc_affiliated_and_responsible_or_major_shareholder Bool)
(declare-const is_fhc_and_responsible_or_major_shareholder Bool)
(declare-const is_fhc_bank_insurance_securities_subsidiary_or_subsidiary_responsible Bool)
(declare-const is_fhc_responsible_or_major_shareholder_sole_proprietor_or_partner_or_enterprise_or_representative Bool)
(declare-const manager_department_authorized Bool)
(declare-const no_proxy_vote Bool)
(declare-const non_credit_transaction_compliance Bool)
(declare-const non_credit_transaction_condition_met Bool)
(declare-const non_credit_transaction_subject Bool)
(declare-const non_loan_transaction_all_related_parties_amount Real)
(declare-const non_loan_transaction_authorized Bool)
(declare-const non_loan_transaction_compliance Bool)
(declare-const non_loan_transaction_condition_met Bool)
(declare-const non_loan_transaction_limit_all_related_parties_ok Bool)
(declare-const non_loan_transaction_limit_single_related_party_ok Bool)
(declare-const non_loan_transaction_single_related_party_amount Real)
(declare-const paid_in_capital Real)
(declare-const penalty Bool)
(declare-const shareholder_meeting_approved Bool)
(declare-const single_corporate_shareholder Bool)
(declare-const total_assets Real)
(declare-const transaction_between_parent_and_subsidiaries Bool)
(declare-const transaction_condition_not_better_than_others Bool)
(declare-const transaction_is_domestic_government_bond Bool)
(declare-const transaction_is_money_market_fund Bool)
(declare-const transaction_is_repo_bond Bool)
(declare-const violation_article_4 Bool)
(declare-const violation_article_45 Bool)
(declare-const violation_article_4_or_5 Bool)
(declare-const violation_article_5 Bool)
(declare-const violation_article_60_14 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:non_credit_transaction_subject] 授信以外交易對象分類
(assert (let ((a!1 (ite is_fhc_and_responsible_or_major_shareholder
                1
                (ite is_fhc_responsible_or_major_shareholder_sole_proprietor_or_partner_or_enterprise_or_representative
                     2
                     (ite is_fhc_affiliated_and_responsible_or_major_shareholder
                          3
                          (ite is_fhc_bank_insurance_securities_subsidiary_or_subsidiary_responsible
                               4
                               0))))))
  (= (ite non_credit_transaction_subject 1 0) a!1)))

; [fhc:non_credit_transaction_condition_met] 授信以外交易條件不得優於其他同類對象且董事會決議通過
(assert (= non_credit_transaction_condition_met
   (and transaction_condition_not_better_than_others
        (<= (/ 6666666667.0 10000000000.0) board_attendance_ratio)
        (<= (/ 3.0 4.0) board_approval_ratio))))

; [fhc:bank_subsidiary_single_related_party_limit_ok] 銀行子公司與單一關係人交易金額不超過淨值10%
(assert (= bank_subsidiary_single_related_party_limit_ok
   (<= bank_subsidiary_single_related_party_transaction_amount
       (* (/ 1.0 10.0) bank_subsidiary_net_worth))))

; [fhc:bank_subsidiary_all_related_parties_limit_ok] 銀行子公司與所有利害關係人交易總額不超過淨值20%
(assert (= bank_subsidiary_all_related_parties_limit_ok
   (<= bank_subsidiary_all_related_parties_transaction_amount
       (* (/ 1.0 5.0) bank_subsidiary_net_worth))))

; [fhc:non_credit_transaction_compliance] 授信以外交易符合條件及限額規定
(assert (= non_credit_transaction_compliance
   (and non_credit_transaction_condition_met
        bank_subsidiary_single_related_party_limit_ok
        bank_subsidiary_all_related_parties_limit_ok)))

; [fhc:violation_article_45] 違反金融控股公司法第45條規定
(assert (= violation_article_45
   (or (not bank_subsidiary_single_related_party_limit_ok)
       (not non_credit_transaction_condition_met)
       (not bank_subsidiary_all_related_parties_limit_ok))))

; [fhc:violation_article_60_14] 違反金融控股公司法第60條第14款（第45條違反）
(assert (= violation_article_60_14 violation_article_45))

; [insurance:non_loan_transaction_condition_met] 保險業與利害關係人放款以外交易條件不得優於其他同類對象且董事會決議通過
(assert (= non_loan_transaction_condition_met
   (and transaction_condition_not_better_than_others
        (<= (/ 6666666667.0 10000000000.0) board_attendance_ratio)
        (<= (/ 3.0 4.0) board_approval_ratio))))

; [insurance:board_member_recusal_compliance] 出席董事對本人或利害關係案件迴避且不得代理出席
(assert (= board_member_recusal_compliance
   (or single_corporate_shareholder (and board_member_recusal no_proxy_vote))))

; [insurance:non_loan_transaction_authorized] 董事會授權經理部門依作業規範辦理特定交易
(assert (= non_loan_transaction_authorized
   (and (<= (/ 6666666667.0 10000000000.0) board_attendance_ratio)
        (<= (/ 3.0 4.0) board_approval_ratio)
        manager_department_authorized
        internal_operating_rules_established)))

; [insurance:non_loan_transaction_limit_single_related_party_ok] 與單一利害關係人交易總餘額不超過業主權益10%
(assert (= non_loan_transaction_limit_single_related_party_ok
   (<= non_loan_transaction_single_related_party_amount
       (* (/ 1.0 10.0) insurance_owner_equity))))

; [insurance:non_loan_transaction_limit_all_related_parties_ok] 與所有利害關係人交易總餘額不超過業主權益60%
(assert (= non_loan_transaction_limit_all_related_parties_ok
   (<= non_loan_transaction_all_related_parties_amount
       (* (/ 3.0 5.0) insurance_owner_equity))))

; [insurance:non_loan_transaction_compliance] 保險業與利害關係人放款以外交易符合條件及限額規定
(assert (= non_loan_transaction_compliance
   (and non_loan_transaction_condition_met
        board_member_recusal_compliance
        (or non_loan_transaction_authorized
            (and non_loan_transaction_limit_single_related_party_ok
                 non_loan_transaction_limit_all_related_parties_ok)))))

; [insurance:violation_article_4] 違反保險業與利害關係人放款以外交易管理辦法第4條規定
(assert (not (= non_loan_transaction_condition_met violation_article_4)))

; [insurance:violation_article_5] 違反保險業與利害關係人放款以外交易管理辦法第5條限額規定
(assert (= violation_article_5
   (or (not non_loan_transaction_limit_single_related_party_ok)
       (not non_loan_transaction_limit_all_related_parties_ok))))

; [insurance:violation_article_4_or_5] 違反保險業放款以外交易管理辦法第4或5條規定
(assert (= violation_article_4_or_5 (or violation_article_4 violation_article_5)))

; [public_company:asset_transaction_reporting_required] 公開發行公司資產交易達一定金額需董事會通過及監察人承認
(assert (= asset_transaction_reporting_required
   (or (<= 300000000.0 asset_transaction_amount)
       (>= (/ asset_transaction_amount total_assets) (/ 1.0 10.0))
       (>= (/ asset_transaction_amount paid_in_capital) (/ 1.0 5.0)))))

; [public_company:asset_transaction_exclusion] 公開發行公司資產交易排除特定債券及基金交易
(assert (= asset_transaction_exclusion
   (or transaction_is_repo_bond
       transaction_is_domestic_government_bond
       transaction_is_money_market_fund)))

; [public_company:asset_transaction_must_report] 公開發行公司資產交易需報告董事會及監察人
(assert (= asset_transaction_must_report
   (and asset_transaction_reporting_required (not asset_transaction_exclusion))))

; [public_company:asset_transaction_shareholder_meeting_required] 公開發行公司資產交易達一定金額需股東會同意
(assert (= asset_transaction_shareholder_meeting_required
   (and (>= (/ asset_transaction_amount total_assets) (/ 1.0 10.0))
        (not transaction_between_parent_and_subsidiaries))))

; [public_company:asset_transaction_compliance] 公開發行公司資產交易符合報告及決議程序
(assert (= asset_transaction_compliance
   (and asset_transaction_must_report
        (or (not asset_transaction_shareholder_meeting_required)
            shareholder_meeting_approved))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反金融控股公司法第45條或第60條第14款，或違反保險業放款以外交易管理辦法第4或5條，或違反公開發行公司資產交易規定
(assert (= penalty
   (or violation_article_4_or_5
       violation_article_60_14
       (not asset_transaction_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= non_credit_transaction_condition_met false))
(assert (= transaction_condition_not_better_than_others false))
(assert (= board_attendance_ratio 0.0))
(assert (= board_approval_ratio 0.0))
(assert (= violation_article_45 true))
(assert (= violation_article_60_14 true))
(assert (= asset_transaction_amount 0.0))
(assert (= asset_transaction_compliance false))
(assert (= asset_transaction_exclusion false))
(assert (= asset_transaction_must_report false))
(assert (= asset_transaction_reporting_required false))
(assert (= asset_transaction_shareholder_meeting_required false))
(assert (= bank_subsidiary_all_related_parties_limit_ok false))
(assert (= bank_subsidiary_all_related_parties_transaction_amount 0.0))
(assert (= bank_subsidiary_net_worth 0.0))
(assert (= bank_subsidiary_single_related_party_limit_ok false))
(assert (= bank_subsidiary_single_related_party_transaction_amount 0.0))
(assert (= board_member_recusal false))
(assert (= board_member_recusal_compliance false))
(assert (= insurance_owner_equity 0.0))
(assert (= internal_operating_rules_established false))
(assert (= is_fhc_affiliated_and_responsible_or_major_shareholder false))
(assert (= is_fhc_and_responsible_or_major_shareholder false))
(assert (= is_fhc_bank_insurance_securities_subsidiary_or_subsidiary_responsible false))
(assert (= is_fhc_responsible_or_major_shareholder_sole_proprietor_or_partner_or_enterprise_or_representative false))
(assert (= manager_department_authorized false))
(assert (= no_proxy_vote false))
(assert (= non_credit_transaction_compliance false))
(assert (= non_credit_transaction_subject false))
(assert (= non_loan_transaction_all_related_parties_amount 0.0))
(assert (= non_loan_transaction_authorized false))
(assert (= non_loan_transaction_compliance false))
(assert (= non_loan_transaction_condition_met false))
(assert (= non_loan_transaction_limit_all_related_parties_ok false))
(assert (= non_loan_transaction_limit_single_related_party_ok false))
(assert (= non_loan_transaction_single_related_party_amount 0.0))
(assert (= paid_in_capital 0.0))
(assert (= penalty false))
(assert (= shareholder_meeting_approved false))
(assert (= single_corporate_shareholder false))
(assert (= total_assets 0.0))
(assert (= transaction_between_parent_and_subsidiaries false))
(assert (= transaction_is_domestic_government_bond false))
(assert (= transaction_is_money_market_fund false))
(assert (= transaction_is_repo_bond false))
(assert (= violation_article_4 false))
(assert (= violation_article_4_or_5 false))
(assert (= violation_article_5 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 23
; Total variables: 48
; Total facts: 48
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
