; SMT2 file generated from compliance case automatic
; Case ID: case_131
; Generated at: 2025-10-21T02:35:06.671319
;
; This file can be executed with Z3:
;   z3 case_131.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const act_1 Bool)
(declare-const act_2 Bool)
(declare-const act_3 Bool)
(declare-const act_4 Bool)
(declare-const act_5 Bool)
(declare-const act_6 Bool)
(declare-const act_7 Bool)
(declare-const act_8 Bool)
(declare-const act_9 Bool)
(declare-const act_10 Bool)
(declare-const act_11 Bool)
(declare-const act_12 Bool)
(declare-const act_13 Bool)
(declare-const act_14 Bool)
(declare-const act_15 Bool)
(declare-const act_16 Bool)
(declare-const act_17 Bool)
(declare-const act_18 Bool)
(declare-const act_19 Bool)
(declare-const act_20 Bool)
(declare-const act_21 Bool)
(declare-const act_22 Bool)
(declare-const act_23 Bool)
(declare-const act_24 Bool)
(declare-const act_25 Bool)
(declare-const act_26 Bool)
(declare-const act_27 Bool)
(declare-const act_28 Bool)
(declare-const act_29 Bool)
(declare-const act_30 Bool)
(declare-const audit_committee_approval Bool)
(declare-const audit_committee_approval_ratio Real)
(declare-const audit_committee_exists Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const board_approval Bool)
(declare-const board_approval_if_no_audit_committee Bool)
(declare-const board_approval_internal_control Bool)
(declare-const board_approval_ratio Real)
(declare-const broker_prohibited_acts_compliance Bool)
(declare-const internal_control_approval_compliance Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const item_1_compliant Bool)
(declare-const item_2_compliant Bool)
(declare-const item_3_compliant Bool)
(declare-const item_4_compliant Bool)
(declare-const item_5_compliant Bool)
(declare-const item_6_compliant Bool)
(declare-const item_7_compliant Bool)
(declare-const item_8_compliant Bool)
(declare-const item_9_compliant Bool)
(declare-const item_10_compliant Bool)
(declare-const item_11_compliant Bool)
(declare-const penalty Bool)
(declare-const penalty_measures_authorized Bool)
(declare-const solicitation_system_established Bool)
(declare-const solicitation_system_executed Bool)
(declare-const solicitation_system_required_items_compliance Bool)
(declare-const violation_163_financial_or_business_rule Bool)
(declare-const violation_167_2 Bool)
(declare-const violation_167_3 Bool)
(declare-const violation_flag Bool)
(declare-const violation_occurred Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violation_occurred] 保險代理人、經紀人、公證人違反法令或有礙健全經營
(assert (= violation_occurred violation_flag))

; [insurance:penalty_measures_authorized] 主管機關得依違反情節輕重採取處分措施
(assert (= penalty_measures_authorized violation_occurred))

; [insurance:internal_control_compliance] 建立且確實執行內部控制、稽核制度及招攬處理制度
(assert (= internal_control_compliance
   (and internal_control_established
        internal_control_executed
        audit_system_established
        audit_system_executed
        solicitation_system_established
        solicitation_system_executed)))

; [insurance:violation_167_2] 違反保險法第163條相關財務或業務管理規定
(assert (= violation_167_2 violation_163_financial_or_business_rule))

; [insurance:violation_167_3] 違反保險法第165條或第163條相關內部控制、稽核、招攬處理制度規定
(assert (= violation_167_3
   (or (not audit_system_established)
       (not solicitation_system_established)
       (not audit_system_executed)
       (not internal_control_established)
       (not internal_control_executed)
       (not solicitation_system_executed))))

; [insurance:solicitation_system_required_items_compliance] 招攬處理制度及程序符合第7條規定項目
(assert (= solicitation_system_required_items_compliance
   (and item_1_compliant
        item_2_compliant
        item_3_compliant
        item_4_compliant
        item_5_compliant
        item_6_compliant
        item_7_compliant
        item_8_compliant
        item_9_compliant
        item_10_compliant
        item_11_compliant)))

; [insurance:board_approval_internal_control] 內部控制、稽核制度及招攬處理制度經董（理）事會通過
(assert (= board_approval_internal_control board_approval))

; [insurance:audit_committee_approval] 設置審計委員會者，內部控制、稽核制度及招攬處理制度經審計委員會半數以上同意
(assert (= audit_committee_approval
   (or (not audit_committee_exists)
       (<= (/ 1.0 2.0) audit_committee_approval_ratio))))

; [insurance:board_approval_if_no_audit_committee] 未經審計委員會同意時，得由三分之二以上董（理）事同意
(assert (= board_approval_if_no_audit_committee
   (or audit_committee_approval (<= (/ 6667.0 10000.0) board_approval_ratio))))

; [insurance:internal_control_approval_compliance] 內部控制、稽核制度及招攬處理制度經適當程序通過
(assert (= internal_control_approval_compliance
   (or audit_committee_approval board_approval_if_no_audit_committee)))

; [insurance:broker_prohibited_acts_compliance] 經紀人及經紀人公司未有第49條禁止行為
(assert (= broker_prohibited_acts_compliance
   (and (not act_1)
        (not act_2)
        (not act_3)
        (not act_4)
        (not act_5)
        (not act_6)
        (not act_7)
        (not act_8)
        (not act_9)
        (not act_10)
        (not act_11)
        (not act_12)
        (not act_13)
        (not act_14)
        (not act_15)
        (not act_16)
        (not act_17)
        (not act_18)
        (not act_19)
        (not act_20)
        (not act_21)
        (not act_22)
        (not act_23)
        (not act_24)
        (not act_25)
        (not act_26)
        (not act_27)
        (not act_28)
        (not act_29)
        (not act_30))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反相關法令或內部控制制度規定，或有禁止行為時處罰
(assert (= penalty
   (or (not internal_control_compliance)
       violation_occurred
       (not solicitation_system_required_items_compliance)
       violation_167_3
       violation_167_2
       (not internal_control_approval_compliance)
       (not broker_prohibited_acts_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_flag true))
(assert (= violation_occurred true))
(assert (= penalty_measures_authorized true))
(assert (= violation_163_financial_or_business_rule false))
(assert (= violation_167_2 false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= audit_system_established false))
(assert (= audit_system_executed false))
(assert (= solicitation_system_established false))
(assert (= solicitation_system_executed false))
(assert (= violation_167_3 true))
(assert (= item_1_compliant false))
(assert (= item_2_compliant false))
(assert (= item_3_compliant false))
(assert (= item_4_compliant false))
(assert (= item_5_compliant false))
(assert (= item_6_compliant false))
(assert (= item_7_compliant false))
(assert (= item_8_compliant false))
(assert (= item_9_compliant false))
(assert (= item_10_compliant false))
(assert (= item_11_compliant false))
(assert (= solicitation_system_required_items_compliance false))
(assert (= board_approval false))
(assert (= board_approval_internal_control false))
(assert (= audit_committee_exists false))
(assert (= audit_committee_approval false))
(assert (= board_approval_if_no_audit_committee false))
(assert (= internal_control_approval_compliance false))
(assert (= act_1 false))
(assert (= act_2 false))
(assert (= act_3 false))
(assert (= act_4 false))
(assert (= act_5 false))
(assert (= act_6 false))
(assert (= act_7 false))
(assert (= act_8 false))
(assert (= act_9 false))
(assert (= act_10 false))
(assert (= act_11 false))
(assert (= act_12 false))
(assert (= act_13 false))
(assert (= act_14 false))
(assert (= act_15 false))
(assert (= act_16 false))
(assert (= act_17 false))
(assert (= act_18 false))
(assert (= act_19 false))
(assert (= act_20 false))
(assert (= act_21 false))
(assert (= act_22 false))
(assert (= act_23 false))
(assert (= act_24 false))
(assert (= act_25 false))
(assert (= act_26 false))
(assert (= act_27 false))
(assert (= act_28 false))
(assert (= act_29 false))
(assert (= act_30 false))
(assert (= broker_prohibited_acts_compliance true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 65
; Total facts: 62
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
