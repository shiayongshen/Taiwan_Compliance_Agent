; SMT2 file generated from compliance case automatic
; Case ID: case_266
; Generated at: 2025-10-21T05:54:09.893902
;
; This file can be executed with Z3:
;   z3 case_266.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_liability_before_registration Bool)
(declare-const business_responsibility Bool)
(declare-const centralized_clearing_required Bool)
(declare-const cleared_at_designated_clearinghouse Bool)
(declare-const consulted_central_bank Bool)
(declare-const definition_of_futures_trading Bool)
(declare-const dismissed Bool)
(declare-const disqualify_19 Bool)
(declare-const exchange_trading Bool)
(declare-const exemption_announced Bool)
(declare-const fail_to_announce_documents Bool)
(declare-const fail_to_keep_documents Bool)
(declare-const fail_to_produce_documents Bool)
(declare-const fail_to_report_documents Bool)
(declare-const false_accounting Bool)
(declare-const false_name Bool)
(declare-const false_or_conceal Bool)
(declare-const forex_clearing_consultation Bool)
(declare-const fraudulent_contract Bool)
(declare-const full_power_trading Bool)
(declare-const futures_contract Bool)
(declare-const futures_option_contract Bool)
(declare-const honest_and_faithful Bool)
(declare-const honesty_and_faithfulness Bool)
(declare-const id_replaced_or_returned Bool)
(declare-const illegal_advertisement Bool)
(declare-const illegal_disclosure Bool)
(declare-const involves_forex Bool)
(declare-const leverage_margin_contract Bool)
(declare-const loan_or_mediator Bool)
(declare-const management_regulations_submitted Bool)
(declare-const minor_violation Bool)
(declare-const misuse_funds Bool)
(declare-const non_employee_doing_business Bool)
(declare-const non_exchange_trading_exemption Bool)
(declare-const non_salesperson_restriction Bool)
(declare-const obstruct_inspection Bool)
(declare-const obstruct_investigation Bool)
(declare-const open_account_for_others Bool)
(declare-const option_contract Bool)
(declare-const other_contracts Bool)
(declare-const other_illegal_behavior Bool)
(declare-const overdue_report Bool)
(declare-const penalty Bool)
(declare-const penalty_119_minor_exemption Bool)
(declare-const penalty_119_violations Bool)
(declare-const penalty_imposed Bool)
(declare-const perform_salesperson_duties Bool)
(declare-const personnel_changed Bool)
(declare-const post_dismissal_reported Bool)
(declare-const prohibited_behaviors Bool)
(declare-const qualify_20_21 Bool)
(declare-const refuse_inspection Bool)
(declare-const refuse_or_obstruct_inspection Bool)
(declare-const refuse_provide_info Bool)
(declare-const refuse_to_appear Bool)
(declare-const registration_allowed Bool)
(declare-const registration_completed Bool)
(declare-const registration_must_report_change Bool)
(declare-const registration_must_return_or_replace_id Bool)
(declare-const regulations_submitted Bool)
(declare-const reported_to_authority Bool)
(declare-const reported_within_5_days Bool)
(declare-const self_interest Bool)
(declare-const subject_to_clearing Bool)
(declare-const swap_contract Bool)
(declare-const training_completed Bool)
(declare-const unauthorized_place Bool)
(declare-const use_others_name Bool)
(declare-const violate_23_24 Bool)
(declare-const violate_article_104_2 Bool)
(declare-const violate_article_105 Bool)
(declare-const violate_article_10_1 Bool)
(declare-const violate_article_18 Bool)
(declare-const violate_article_3_2_but Bool)
(declare-const violate_article_45_2_pre Bool)
(declare-const violate_article_5 Bool)
(declare-const violate_article_55 Bool)
(declare-const violate_article_56_4 Bool)
(declare-const violate_article_57_1 Bool)
(declare-const violate_article_64 Bool)
(declare-const violate_article_65_1 Bool)
(declare-const violate_article_66_1 Bool)
(declare-const violate_article_67 Bool)
(declare-const violate_article_70_1 Bool)
(declare-const violate_article_72_1 Bool)
(declare-const violate_article_73 Bool)
(declare-const violate_article_74 Bool)
(declare-const violate_article_78_1 Bool)
(declare-const violate_article_79 Bool)
(declare-const violate_article_80_3 Bool)
(declare-const violate_article_81 Bool)
(declare-const violate_article_82_2 Bool)
(declare-const violate_article_84_2_pre Bool)
(declare-const violate_article_85_1 Bool)
(declare-const violate_article_87_1 Bool)
(declare-const violate_article_88 Bool)
(declare-const violate_article_97_1_1 Bool)
(declare-const violate_article_97_1_3 Bool)
(declare-const violate_law Bool)
(declare-const violate_order Bool)
(declare-const violate_order_45_2_post Bool)
(declare-const violate_order_56_5 Bool)
(declare-const violate_order_80_4 Bool)
(declare-const violate_order_82_3 Bool)
(declare-const violate_order_85_2 Bool)
(declare-const violate_order_8_2 Bool)
(declare-const violate_order_93 Bool)
(declare-const violate_order_98_1 Bool)
(declare-const violate_self_regulation Bool)
(declare-const violation_occurred Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [futures:violation_occurred] 期貨交易所、期貨結算機構或期貨業負責人或受雇人違反本法或命令
(assert (= violation_occurred (or violate_law violate_order)))

; [futures:penalty_imposed] 主管機關得依情節輕重命令停止業務或解除職務
(assert (= penalty_imposed violation_occurred))

; [futures:post_dismissal_reported] 解除職務後由期貨交易所等申報主管機關
(assert (= post_dismissal_reported (or reported_to_authority (not dismissed))))

; [futures:penalty_119_violations] 違反期貨交易法第119條列舉之規定
(assert (= penalty_119_violations
   (or refuse_inspection
       violate_article_84_2_pre
       violate_article_87_1
       fail_to_announce_documents
       violate_article_104_2
       violate_article_10_1
       violate_article_88
       fail_to_keep_documents
       violate_order_45_2_post
       violate_article_97_1_3
       violate_article_65_1
       fail_to_report_documents
       violate_order_98_1
       violate_article_72_1
       violate_article_105
       violate_order_8_2
       violate_order_82_3
       violate_article_97_1_1
       violate_article_70_1
       violate_article_18
       refuse_provide_info
       violate_order_56_5
       fail_to_produce_documents
       violate_article_57_1
       violate_article_80_3
       violate_article_79
       violate_article_5
       refuse_to_appear
       violate_article_3_2_but
       violate_article_82_2
       violate_article_45_2_pre
       violate_order_80_4
       violate_article_85_1
       violate_article_66_1
       violate_order_85_2
       violate_article_74
       violate_article_64
       violate_article_73
       overdue_report
       violate_article_55
       violate_article_67
       violate_article_56_4
       violate_article_78_1
       violate_order_93
       obstruct_inspection
       obstruct_investigation
       violate_article_81)))

; [futures:penalty_119_minor_exemption] 違反119條情節輕微得免罰
(assert (= penalty_119_minor_exemption
   (or (not penalty_119_violations) (not minor_violation))))

; [futures:registration_allowed] 期貨顧問事業負責人及業務員登記條件符合
(assert (= registration_allowed
   (and (not disqualify_19)
        qualify_20_21
        (not violate_23_24)
        training_completed)))

; [futures:registration_must_report_change] 期貨顧問事業負責人及業務員異動後五營業日內申報
(assert (= registration_must_report_change
   (or (not personnel_changed) reported_within_5_days)))

; [futures:registration_must_return_or_replace_id] 異動後辦理工作證換發或繳回
(assert (= registration_must_return_or_replace_id
   (or id_replaced_or_returned (not personnel_changed))))

; [futures:business_liability_before_registration] 異動登記前期貨顧問事業對人員行為仍負責
(assert (= business_liability_before_registration
   (or registration_completed business_responsibility)))

; [futures:honesty_and_faithfulness] 期貨顧問事業負責人及業務員應誠實信用忠實執行業務
(assert (= honesty_and_faithfulness honest_and_faithful))

; [futures:prohibited_behaviors] 期貨顧問事業及人員不得有禁止行為
(assert (not (= (or full_power_trading
            false_or_conceal
            open_account_for_others
            false_accounting
            use_others_name
            illegal_disclosure
            illegal_advertisement
            loan_or_mediator
            fraudulent_contract
            non_employee_doing_business
            misuse_funds
            unauthorized_place
            violate_self_regulation
            other_illegal_behavior
            self_interest
            false_name
            refuse_or_obstruct_inspection)
        prohibited_behaviors)))

; [futures:non_salesperson_restriction] 非業務員不得有禁止行為且不得執行業務員職務
(assert (= non_salesperson_restriction
   (and (not prohibited_behaviors) (not perform_salesperson_duties))))

; [futures:management_regulations_submitted] 期貨顧問事業管理規範由同業公會訂定並申報主管機關
(assert (= management_regulations_submitted regulations_submitted))

; [futures:definition_of_futures_trading] 期貨交易法第3條期貨交易定義
(assert (= definition_of_futures_trading
   (or futures_option_contract
       option_contract
       futures_contract
       swap_contract
       other_contracts
       leverage_margin_contract)))

; [futures:non_exchange_trading_exemption] 非期貨交易所交易得經主管機關公告不適用本法
(assert (= non_exchange_trading_exemption (or exchange_trading exemption_announced)))

; [futures:centralized_clearing_required] 符合主管機關規定應集中結算之期貨交易應集中結算
(assert (= centralized_clearing_required
   (or cleared_at_designated_clearinghouse (not subject_to_clearing))))

; [futures:forex_clearing_consultation] 涉及外匯事項應先會商中央銀行同意
(assert (= forex_clearing_consultation (or consulted_central_bank (not involves_forex))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反本法或命令，或違反第119條規定且未免罰時處罰
(assert (= penalty
   (or penalty_imposed (and penalty_119_violations (not minor_violation)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_law true))
(assert (= violate_order true))
(assert (= violation_occurred true))
(assert (= penalty_imposed true))
(assert (= penalty_119_violations true))
(assert (= minor_violation false))
(assert (= perform_salesperson_duties true))
(assert (= non_employee_doing_business true))
(assert (= training_completed false))
(assert (= dismissed true))
(assert (= reported_to_authority false))
(assert (= post_dismissal_reported false))
(assert (= personnel_changed true))
(assert (= reported_within_5_days false))
(assert (= id_replaced_or_returned false))
(assert (= disqualify_19 false))
(assert (= qualify_20_21 true))
(assert (= violate_23_24 true))
(assert (= prohibited_behaviors true))
(assert (= honest_and_faithful false))
(assert (= registration_completed false))
(assert (= business_responsibility true))
(assert (= business_liability_before_registration true))
(assert (= regulations_submitted true))
(assert (= management_regulations_submitted true))
(assert (= exchange_trading true))
(assert (= exemption_announced false))
(assert (= definition_of_futures_trading true))
(assert (= futures_contract true))
(assert (= option_contract false))
(assert (= futures_option_contract false))
(assert (= leverage_margin_contract false))
(assert (= swap_contract false))
(assert (= other_contracts false))
(assert (= involves_forex false))
(assert (= consulted_central_bank false))
(assert (= subject_to_clearing true))
(assert (= cleared_at_designated_clearinghouse true))
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
; Total variables: 111
; Total facts: 39
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
