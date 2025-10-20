; SMT2 file generated from compliance case automatic
; Case ID: case_446
; Generated at: 2025-10-19T16:10:11.927583
;
; This file can be executed with Z3:
;   z3 case_446.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accounting_reporting_compliance Bool)
(declare-const branch_establishment_permitted Bool)
(declare-const business_direct_interaction_permitted Bool)
(declare-const business_restriction_compliance Bool)
(declare-const claims_handled_correctly Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_violation_penalty Bool)
(declare-const internal_handling_compliance Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_violation_penalty Bool)
(declare-const notification_provided_as_required Bool)
(declare-const underwriting_claims_recording_compliance Bool)
(declare-const underwriting_data_recorded_correctly Bool)
(declare-const violation_15_19_46_compliance Bool)
(declare-const violation_18_1_20_compliance Bool)
(declare-const violation_8_1_compliance Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:internal_control_compliance] 建立並執行內部控制及稽核制度
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_compliance] 建立並執行內部處理制度及程序
(assert (= internal_handling_compliance
   (and internal_handling_established internal_handling_executed)))

; [insurance:underwriting_claims_recording_compliance] 正確記載承保資料及辦理理賠，並依規定通知
(assert (= underwriting_claims_recording_compliance
   (and underwriting_data_recorded_correctly
        claims_handled_correctly
        notification_provided_as_required)))

; [insurance:violation_8_1_compliance] 遵守保險法第8條第一項規定
(assert violation_8_1_compliance)

; [insurance:violation_18_1_20_compliance] 遵守保險法第18條第一項及第二十條規定
(assert violation_18_1_20_compliance)

; [insurance:accounting_reporting_compliance] 遵守會計處理與業務財務資料陳報、準備金提存、保管、運用、收回及移轉規定
(assert accounting_reporting_compliance)

; [insurance:violation_15_19_46_compliance] 遵守第十五條、第十九條第一項、第二項及第四十六條所定辦法中正確記載承保資料、辦理理賠及通知方式規定
(assert violation_15_19_46_compliance)

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一相關規定時處罰
(assert (= penalty
   (or (not accounting_reporting_compliance)
       (not violation_15_19_46_compliance)
       (not violation_8_1_compliance)
       (not violation_18_1_20_compliance))))

; [insurance:internal_control_violation_penalty] 違反保險法第148-3條內部控制及稽核制度規定
(assert (= internal_control_violation_penalty
   (and (not internal_control_established) (not internal_control_executed))))

; [insurance:internal_handling_violation_penalty] 違反保險法第148-3條內部處理制度及程序規定
(assert (= internal_handling_violation_penalty
   (and (not internal_handling_established) (not internal_handling_executed))))

; [meta:penalty_conditions_internal_control_handling] 處罰條件：未建立或未執行內部控制、稽核或內部處理制度時處罰
(assert (= penalty
   (or (not internal_control_compliance) (not internal_handling_compliance))))

; [taiwan_china:business_direct_interaction_permitted] 經財政部許可，得與大陸地區人民及相關機構有業務直接往來
(assert business_direct_interaction_permitted)

; [taiwan_china:branch_establishment_permitted] 臺灣地區金融保險證券期貨機構在大陸地區設立分支機構經財政部許可
(assert branch_establishment_permitted)

; [taiwan_china:business_restriction_compliance] 遵守財政部及行政院核定之限制或禁止業務直接往來命令
(assert business_restriction_compliance)

; [meta:penalty_conditions_taiwan_china] 處罰條件：違反臺灣地區與大陸地區人民關係條例第36條及相關限制命令時處罰
(assert (= penalty
   (or (not branch_establishment_permitted)
       (not business_direct_interaction_permitted)
       (not business_restriction_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established true))
(assert (= internal_control_executed true))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed true))
(assert (= underwriting_data_recorded_correctly false))
(assert (= claims_handled_correctly false))
(assert (= notification_provided_as_required true))
(assert (= violation_8_1_compliance true))
(assert (= violation_18_1_20_compliance true))
(assert (= accounting_reporting_compliance true))
(assert (= violation_15_19_46_compliance false))
(assert (= business_direct_interaction_permitted false))
(assert (= branch_establishment_permitted true))
(assert (= business_restriction_compliance true))
(assert (= penalty true))
(assert (= internal_control_compliance false))
(assert (= internal_control_violation_penalty false))
(assert (= internal_handling_compliance false))
(assert (= internal_handling_violation_penalty false))
(assert (= underwriting_claims_recording_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 20
; Total facts: 20
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
