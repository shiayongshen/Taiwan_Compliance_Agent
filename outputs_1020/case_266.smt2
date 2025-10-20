; SMT2 file generated from compliance case automatic
; Case ID: case_266
; Generated at: 2025-10-19T11:44:07.027886
;
; This file can be executed with Z3:
;   z3 case_266.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const account_opening_for_others Bool)
(declare-const change_reported_within_5_days Bool)
(declare-const cleared_at_designated_clearinghouse Bool)
(declare-const clearing_involves_foreign_exchange Bool)
(declare-const consulted_central_bank Bool)
(declare-const definition_of_futures_transactions Bool)
(declare-const dismissed Bool)
(declare-const disqualify_19 Bool)
(declare-const executing_duty Bool)
(declare-const exempted_by_authority Bool)
(declare-const false_accounting Bool)
(declare-const false_or_concealment Bool)
(declare-const foreign_exchange_clearing_consultation Bool)
(declare-const fraudulent_contract Bool)
(declare-const full_authority_trading Bool)
(declare-const honest_and_faithful Bool)
(declare-const honesty_and_faithfulness Bool)
(declare-const illegal_advertisement Bool)
(declare-const illegal_disclosure Bool)
(declare-const loan_or_mediation Bool)
(declare-const management_regulations_by_association Bool)
(declare-const management_regulations_submitted Bool)
(declare-const mandatory_centralized_clearing Bool)
(declare-const misuse_of_funds Bool)
(declare-const non_employee_engagement Bool)
(declare-const non_employee_execute_duty Bool)
(declare-const non_employee_prohibited_behavior Bool)
(declare-const non_employee_restriction Bool)
(declare-const non_exchange_transactions_exemption Bool)
(declare-const non_registered_name Bool)
(declare-const other_illegal_behavior Bool)
(declare-const penalty Bool)
(declare-const penalty_impose_stop_or_dismiss Bool)
(declare-const penalty_override_false Bool)
(declare-const personnel_changed Bool)
(declare-const prohibited_behaviors Bool)
(declare-const qualify_20_21 Bool)
(declare-const refuse_or_obstruct_inspection Bool)
(declare-const registration_allowed Bool)
(declare-const registration_changed Bool)
(declare-const registration_required_before_duty Bool)
(declare-const report_after_dismissal Bool)
(declare-const report_change_within_5_days Bool)
(declare-const reported_to_authority Bool)
(declare-const responsibility_before_registration_change Bool)
(declare-const responsible_for_personnel_behavior Bool)
(declare-const self_interest_behavior Bool)
(declare-const subject_to_clearing_requirement Bool)
(declare-const training_completed Bool)
(declare-const transaction_meets_definition Bool)
(declare-const transaction_on_futures_exchange Bool)
(declare-const unauthorized_fixed_place Bool)
(declare-const use_others_name Bool)
(declare-const violate_23_24 Bool)
(declare-const violate_self_regulation Bool)
(declare-const violation_119_1 Bool)
(declare-const violation_119_1_occurred Bool)
(declare-const violation_119_2 Bool)
(declare-const violation_119_2_occurred Bool)
(declare-const violation_119_3 Bool)
(declare-const violation_119_3_occurred Bool)
(declare-const violation_119_4 Bool)
(declare-const violation_119_4_occurred Bool)
(declare-const violation_119_5 Bool)
(declare-const violation_119_5_occurred Bool)
(declare-const violation_119_6 Bool)
(declare-const violation_119_6_occurred Bool)
(declare-const violation_119_7 Bool)
(declare-const violation_119_7_occurred Bool)
(declare-const violation_119_8 Bool)
(declare-const violation_119_8_occurred Bool)
(declare-const violation_119_9 Bool)
(declare-const violation_119_9_occurred Bool)
(declare-const violation_119_minor Bool)
(declare-const violation_119_penalty_applicable Bool)
(declare-const violation_occurred Bool)
(declare-const violation_of_law_or_order Bool)
(declare-const violation_penalty_conditions Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [futures:violation_of_law_or_order] 期貨交易所、期貨結算機構或期貨業負責人或受雇人違反本法或命令
(assert violation_of_law_or_order)

; [futures:penalty_impose_stop_or_dismiss] 主管機關得命停止業務六個月以下或解除職務
(assert (= penalty_impose_stop_or_dismiss violation_of_law_or_order))

; [futures:report_after_dismissal] 解除職務後應由期貨交易所等申報主管機關
(assert (= report_after_dismissal (or reported_to_authority (not dismissed))))

; [futures:violation_penalty_conditions] 違反第101條及相關規定之行為
(assert (= violation_penalty_conditions violation_occurred))

; [futures:violation_119_1] 違反期貨交易法第5條、第10條第1項、第18條等規定
(assert (= violation_119_1 violation_119_1_occurred))

; [futures:violation_119_2] 違反依第8條第2項、第45條第2項後段等命令
(assert (= violation_119_2 violation_119_2_occurred))

; [futures:violation_119_3] 違反第三條第二項但書未依主管機關規定集中結算或期貨結算機構違反規定
(assert (= violation_119_3 violation_119_3_occurred))

; [futures:violation_119_4] 期貨商違反第七十九條準用第十八條規定
(assert violation_119_4)

; [futures:violation_119_5] 槓桿交易商違反相關規定
(assert (= violation_119_5 violation_119_5_occurred))

; [futures:violation_119_6] 期貨服務事業違反相關規定
(assert (= violation_119_6 violation_119_6_occurred))

; [futures:violation_119_7] 逾期不提出帳簿、書類或妨礙檢查
(assert (= violation_119_7 violation_119_7_occurred))

; [futures:violation_119_8] 期貨交易所等未製作、申報、公告、備置或保存相關文件
(assert (= violation_119_8 violation_119_8_occurred))

; [futures:violation_119_9] 規避、妨礙或拒絕主管機關調查或拒不到達辦公處所備詢
(assert (= violation_119_9 violation_119_9_occurred))

; [futures:violation_119_penalty_applicable] 違反第119條規定且情節非輕微
(assert (= violation_119_penalty_applicable
   (and (or violation_119_1
            violation_119_2
            violation_119_3
            violation_119_4
            violation_119_5
            violation_119_6
            violation_119_7
            violation_119_8
            violation_119_9)
        (not violation_119_minor))))

; [futures:registration_allowed] 期貨顧問事業負責人及業務員登記允許
(assert (= registration_allowed
   (and (not disqualify_19)
        qualify_20_21
        (not violate_23_24)
        training_completed)))

; [futures:registration_required_before_duty] 非經登記不得執行職務
(assert (= registration_required_before_duty
   (or registration_allowed (not executing_duty))))

; [futures:report_change_within_5_days] 期貨顧問事業異動後五個營業日內申報並辦理工作證換發或繳回
(assert (= report_change_within_5_days
   (or change_reported_within_5_days (not personnel_changed))))

; [futures:responsibility_before_registration_change] 異動登記前期貨顧問事業對人員行為仍不能免責
(assert (= responsibility_before_registration_change
   (or registration_changed responsible_for_personnel_behavior)))

; [futures:honesty_and_faithfulness] 期貨顧問事業負責人及業務員應本誠實及信用原則，忠實執行業務
(assert honesty_and_faithfulness)

; [futures:prohibited_behaviors] 期貨顧問事業及人員不得有禁止之行為
(assert (not (= (or violate_self_regulation
            misuse_of_funds
            self_interest_behavior
            illegal_advertisement
            fraudulent_contract
            false_or_concealment
            refuse_or_obstruct_inspection
            loan_or_mediation
            account_opening_for_others
            false_accounting
            non_employee_engagement
            full_authority_trading
            other_illegal_behavior
            use_others_name
            unauthorized_fixed_place
            non_registered_name
            illegal_disclosure)
        prohibited_behaviors)))

; [futures:non_employee_restriction] 非業務員之其他從業人員不得有禁止行為且不得執行業務員職務
(assert (not (= (or non_employee_execute_duty non_employee_prohibited_behavior)
        non_employee_restriction)))

; [futures:management_regulations_by_association] 期貨顧問事業負責人、業務員及其他從業人員管理規範由同業公會訂定並申報主管機關
(assert (= management_regulations_by_association management_regulations_submitted))

; [futures:definition_of_futures_transactions] 期貨交易法第3條定義期貨交易範圍
(assert definition_of_futures_transactions)

; [futures:non_exchange_transactions_exemption] 非在期貨交易所進行之期貨交易得經主管機關公告不適用本法
(assert (= non_exchange_transactions_exemption
   (or exempted_by_authority transaction_on_futures_exchange)))

; [futures:mandatory_centralized_clearing] 符合主管機關規定應集中結算之期貨交易範圍者，應於指定期貨結算機構集中結算
(assert (= mandatory_centralized_clearing
   (or (not subject_to_clearing_requirement)
       cleared_at_designated_clearinghouse)))

; [futures:foreign_exchange_clearing_consultation] 涉及外匯事項之集中結算應先會商中央銀行同意
(assert (= foreign_exchange_clearing_consultation
   (or consulted_central_bank (not clearing_involves_foreign_exchange))))

; [meta:penalty_default_false] 預設不處罰
(assert (or (not penalty) violation_of_law_or_order violation_119_penalty_applicable))

; [meta:penalty_conditions] 處罰條件：違反期貨交易法第101條或第119條規定且情節非輕微時處罰
(assert (= penalty
   (and (or violation_of_law_or_order violation_119_penalty_applicable)
        (not penalty_override_false))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_occurred true))
(assert (= violation_of_law_or_order true))
(assert (= penalty_impose_stop_or_dismiss true))
(assert (= dismissed true))
(assert (= reported_to_authority true))
(assert (= executing_duty true))
(assert (= registration_allowed false))
(assert (= training_completed false))
(assert (= non_employee_execute_duty true))
(assert (= non_employee_prohibited_behavior false))
(assert (= non_employee_restriction false))
(assert (= violation_119_2_occurred true))
(assert (= violation_119_2 true))
(assert (= violation_119_penalty_applicable true))
(assert (= penalty true))
(assert (= penalty_override_false false))
(assert (= management_regulations_submitted true))
(assert (= management_regulations_by_association true))
(assert (= responsible_for_personnel_behavior true))
(assert (= registration_changed false))
(assert (= personnel_changed true))
(assert (= change_reported_within_5_days false))
(assert (= report_after_dismissal true))
(assert (= honest_and_faithful true))
(assert (= honesty_and_faithfulness true))
(assert (= transaction_meets_definition true))
(assert (= transaction_on_futures_exchange true))
(assert (= exempted_by_authority false))
(assert (= subject_to_clearing_requirement false))
(assert (= cleared_at_designated_clearinghouse false))
(assert (= clearing_involves_foreign_exchange false))
(assert (= consulted_central_bank false))
(assert (= account_opening_for_others false))
(assert (= disqualify_19 false))
(assert (= qualify_20_21 true))
(assert (= violate_23_24 true))
(assert (= violate_self_regulation false))
(assert (= fraudulent_contract false))
(assert (= false_or_concealment false))
(assert (= self_interest_behavior false))
(assert (= non_registered_name false))
(assert (= unauthorized_fixed_place false))
(assert (= illegal_disclosure false))
(assert (= false_accounting false))
(assert (= refuse_or_obstruct_inspection false))
(assert (= misuse_of_funds false))
(assert (= loan_or_mediation false))
(assert (= full_authority_trading false))
(assert (= illegal_advertisement false))
(assert (= use_others_name false))
(assert (= non_employee_engagement false))
(assert (= other_illegal_behavior false))
(assert (= definition_of_futures_transactions false))
(assert (= foreign_exchange_clearing_consultation false))
(assert (= mandatory_centralized_clearing false))
(assert (= non_exchange_transactions_exemption false))
(assert (= prohibited_behaviors false))
(assert (= registration_required_before_duty false))
(assert (= report_change_within_5_days false))
(assert (= responsibility_before_registration_change false))
(assert (= violation_119_1 false))
(assert (= violation_119_1_occurred false))
(assert (= violation_119_3 false))
(assert (= violation_119_3_occurred false))
(assert (= violation_119_4 false))
(assert (= violation_119_4_occurred false))
(assert (= violation_119_5 false))
(assert (= violation_119_5_occurred false))
(assert (= violation_119_6 false))
(assert (= violation_119_6_occurred false))
(assert (= violation_119_7 false))
(assert (= violation_119_7_occurred false))
(assert (= violation_119_8 false))
(assert (= violation_119_8_occurred false))
(assert (= violation_119_9 false))
(assert (= violation_119_9_occurred false))
(assert (= violation_119_minor false))
(assert (= violation_penalty_conditions false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 28
; Total variables: 78
; Total facts: 78
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
