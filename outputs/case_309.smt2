; SMT2 file generated from compliance case automatic
; Case ID: case_309
; Generated at: 2025-10-21T06:54:05.935280
;
; This file can be executed with Z3:
;   z3 case_309.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_executed_by_registered_salesperson Bool)
(declare-const business_managed_by_dedicated_department Bool)
(declare-const dedicated_department_assigned Bool)
(declare-const dedicated_person_assigned Bool)
(declare-const internal_control_system_change_approved_by_board Bool)
(declare-const internal_control_system_change_reported Bool)
(declare-const internal_control_system_change_within_deadline Bool)
(declare-const internal_control_system_defined Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_recorded Bool)
(declare-const internal_control_system_reported_to_board Bool)
(declare-const internal_control_system_updated Bool)
(declare-const involved_in_untrustworthy_activities Bool)
(declare-const not_announce_reports Bool)
(declare-const not_completed_training Bool)
(declare-const not_meet_qualification_article_26_3 Bool)
(declare-const not_preserve_files Bool)
(declare-const not_produce_books Bool)
(declare-const not_report_documents Bool)
(declare-const not_store_records Bool)
(declare-const obstruct_inspection Bool)
(declare-const obstruct_investigation Bool)
(declare-const overdue_non_submission Bool)
(declare-const penalty Bool)
(declare-const personnel_change_reported_timely Bool)
(declare-const personnel_change_reported_within_5_days Bool)
(declare-const personnel_registered Bool)
(declare-const personnel_registration_revoked Bool)
(declare-const personnel_registration_revoked_conditions Bool)
(declare-const personnel_registration_valid Bool)
(declare-const personnel_responsibility_before_registration Bool)
(declare-const refuse_inspection Bool)
(declare-const refuse_provide_documents Bool)
(declare-const registered_salesperson_executing Bool)
(declare-const responsible_for_personnel_before_registration Bool)
(declare-const unjustified_absence Bool)
(declare-const violate_article_104_2 Bool)
(declare-const violate_article_105 Bool)
(declare-const violate_article_10_1 Bool)
(declare-const violate_article_18 Bool)
(declare-const violate_article_28_1 Bool)
(declare-const violate_article_29 Bool)
(declare-const violate_article_3_2_clause Bool)
(declare-const violate_article_45_2_pre Bool)
(declare-const violate_article_5 Bool)
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
(declare-const violate_article_79_18 Bool)
(declare-const violate_article_80_3 Bool)
(declare-const violate_article_81_18 Bool)
(declare-const violate_article_82_2 Bool)
(declare-const violate_article_84_2_pre Bool)
(declare-const violate_article_85_1 Bool)
(declare-const violate_article_87_1 Bool)
(declare-const violate_article_88_18 Bool)
(declare-const violate_article_97_1_1 Bool)
(declare-const violate_article_97_1_3 Bool)
(declare-const violate_clearing_entity_article_55_18 Bool)
(declare-const violate_order_article_45_2_post Bool)
(declare-const violate_order_article_56_5 Bool)
(declare-const violate_order_article_80_4 Bool)
(declare-const violate_order_article_82_3 Bool)
(declare-const violate_order_article_85_2 Bool)
(declare-const violate_order_article_8_2 Bool)
(declare-const violate_order_article_93 Bool)
(declare-const violation_any Bool)
(declare-const violation_clearing_mandate Bool)
(declare-const violation_document_noncompliance Bool)
(declare-const violation_futures_broker Bool)
(declare-const violation_futures_service Bool)
(declare-const violation_leverage_trader Bool)
(declare-const violation_non_submission_or_obstruction Bool)
(declare-const violation_obstruct_investigation Bool)
(declare-const violation_order Bool)
(declare-const work_permit_reissued_or_returned Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [futures:violation_any] 違反期貨交易法第119條所列任一規定
(assert (= violation_any
   (or violate_article_10_1
       violate_article_45_2_pre
       violate_article_70_1
       violate_article_74
       violate_article_5
       violate_article_97_1_1
       violate_article_104_2
       violate_article_97_1_3
       violate_article_80_3
       violate_article_57_1
       violate_article_82_2
       violate_article_66_1
       violate_article_84_2_pre
       violate_article_73
       violate_article_87_1
       violate_article_72_1
       violate_article_64
       violate_article_78_1
       violate_article_56_4
       violate_article_65_1
       violate_article_105
       violate_article_85_1
       violate_article_18
       violate_article_67)))

; [futures:violation_order] 違反依第8條第2項、第45條第2項後段、第56條第5項、第80條第4項、第82條第3項、第85條第2項或第93條所發布之命令
(assert (= violation_order
   (or violate_order_article_80_4
       violate_order_article_8_2
       violate_order_article_45_2_post
       violate_order_article_56_5
       violate_order_article_82_3
       violate_order_article_93
       violate_order_article_85_2)))

; [futures:violation_clearing_mandate] 違反第三條第二項但書未依主管機關規定於指定期貨結算機構集中結算，或期貨結算機構違反第五十五條準用第十八條規定
(assert (= violation_clearing_mandate
   (or violate_article_3_2_clause violate_clearing_entity_article_55_18)))

; [futures:violation_futures_broker] 期貨商違反第七十九條準用第十八條規定
(assert (= violation_futures_broker violate_article_79_18))

; [futures:violation_leverage_trader] 槓桿交易商違反第八十一條準用第十八條、第五十七條第一項、第六十四條、第六十五條第一項、第六十六條第一項、第六十七條、第七十條第一項、第七十二條第一項、第七十三條、第七十四條或第七十八條第一項規定
(assert (= violation_leverage_trader
   (or violate_article_70_1
       violate_article_74
       violate_article_81_18
       violate_article_57_1
       violate_article_66_1
       violate_article_73
       violate_article_72_1
       violate_article_64
       violate_article_78_1
       violate_article_65_1
       violate_article_67)))

; [futures:violation_futures_service] 期貨服務事業違反第八十八條準用第十八條、第五十七條第一項、第六十四條、第六十五條第一項、第六十六條第一項或第七十四條規定
(assert (= violation_futures_service
   (or violate_article_74
       violate_article_88_18
       violate_article_57_1
       violate_article_66_1
       violate_article_64
       violate_article_65_1)))

; [futures:violation_non_submission_or_obstruction] 逾期不提出主管機關命令之帳簿、書類或其他有關物件或報告資料，或規避、妨礙、拒絕主管機關檢查
(assert (= violation_non_submission_or_obstruction
   (or obstruct_inspection refuse_inspection overdue_non_submission)))

; [futures:violation_document_noncompliance] 期貨交易所、期貨結算機構、期貨業、同業公會未依法或主管機關命令製作、申報、公告、備置或保存帳簿、文據、財務報告或其他業務文件
(assert (= violation_document_noncompliance
   (or not_store_records
       not_produce_books
       not_report_documents
       not_preserve_files
       not_announce_reports)))

; [futures:violation_obstruct_investigation] 規避、妨礙或拒絕主管機關調查，或拒不提供資料文件，或無正當理由拒不到達辦公處所備詢
(assert (= violation_obstruct_investigation
   (or obstruct_investigation refuse_provide_documents unjustified_absence)))

; [futures:internal_control_system_established] 期貨交易輔助人依規定訂定內部控制制度
(assert (= internal_control_system_established
   (and internal_control_system_defined
        internal_control_system_reported_to_board
        internal_control_system_recorded)))

; [futures:internal_control_system_updated] 內部控制制度變更經董事會同意並於期限內變更
(assert (= internal_control_system_updated
   (and internal_control_system_change_approved_by_board
        internal_control_system_change_reported
        internal_control_system_change_within_deadline)))

; [futures:business_managed_by_dedicated_department] 證券商期貨交易輔助業務由專責部門辦理並指派專人管理
(assert (= business_managed_by_dedicated_department
   (and dedicated_department_assigned dedicated_person_assigned)))

; [futures:business_executed_by_registered_salesperson] 證券商期貨交易輔助業務由登記合格業務員執行
(assert (= business_executed_by_registered_salesperson registered_salesperson_executing))

; [futures:personnel_registration_valid] 期貨交易輔助人負責人、經理人及業務員登記有效且無撤銷情事
(assert (= personnel_registration_valid
   (and personnel_registered (not personnel_registration_revoked))))

; [futures:personnel_registration_revoked_conditions] 期貨交易輔助人負責人、經理人及業務員登記撤銷條件
(assert (= personnel_registration_revoked_conditions
   (or violate_article_29
       involved_in_untrustworthy_activities
       violate_article_28_1
       not_completed_training
       not_meet_qualification_article_26_3)))

; [futures:personnel_change_reported_timely] 期貨交易輔助人負責人、經理人及業務員異動於五日內申報並辦理工作證換發或繳回
(assert (= personnel_change_reported_timely
   (and personnel_change_reported_within_5_days
        work_permit_reissued_or_returned)))

; [futures:personnel_responsibility_before_registration] 期貨交易輔助人辦理異動登記前，對該人員行為仍不能免責
(assert (= personnel_responsibility_before_registration
   responsible_for_personnel_before_registration))

; [futures:penalty_default_false] 預設不處罰
(assert (not penalty))

; [futures:penalty_conditions] 處罰條件：違反期貨交易法第119條任一規定或相關命令，或未依規定辦理期貨交易輔助業務管理規則者
(assert (= penalty
   (or violation_obstruct_investigation
       (not personnel_change_reported_timely)
       personnel_registration_revoked_conditions
       violation_non_submission_or_obstruction
       (not internal_control_system_established)
       violation_any
       violation_futures_broker
       (not business_managed_by_dedicated_department)
       violation_order
       violation_document_noncompliance
       violation_futures_service
       violation_clearing_mandate
       (not personnel_registration_valid)
       violation_leverage_trader
       (not business_executed_by_registered_salesperson)
       (not internal_control_system_updated))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= registered_salesperson_executing false))
(assert (= personnel_change_reported_within_5_days false))
(assert (= work_permit_reissued_or_returned false))
(assert (= personnel_registered true))
(assert (= personnel_registration_revoked false))
(assert (= violate_article_28_1 true))
(assert (= violate_order_article_82_3 true))
(assert (= violation_any true))
(assert (= violation_order true))
(assert (= business_managed_by_dedicated_department true))
(assert (= dedicated_department_assigned true))
(assert (= dedicated_person_assigned true))
(assert (= internal_control_system_defined true))
(assert (= internal_control_system_reported_to_board true))
(assert (= internal_control_system_recorded true))
(assert (= internal_control_system_established true))
(assert (= internal_control_system_change_approved_by_board true))
(assert (= internal_control_system_change_reported true))
(assert (= internal_control_system_change_within_deadline true))
(assert (= internal_control_system_updated true))
(assert (= personnel_registration_revoked_conditions false))
(assert (= personnel_change_reported_timely false))
(assert (= business_executed_by_registered_salesperson false))
(assert (= responsible_for_personnel_before_registration true))
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
; Total variables: 84
; Total facts: 25
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
