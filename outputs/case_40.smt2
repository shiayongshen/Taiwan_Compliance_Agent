; SMT2 file generated from compliance case automatic
; Case ID: case_40
; Generated at: 2025-10-20T23:49:28.468422
;
; This file can be executed with Z3:
;   z3 case_40.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const applicant_confirmed Bool)
(declare-const applicant_signature_valid Bool)
(declare-const applicant_statement_compliant Bool)
(declare-const collection_not_violating_public_interest Bool)
(declare-const collection_only_to_cardholder_and_guarantor Bool)
(declare-const collection_practices_compliant Bool)
(declare-const credit_card_business_license_granted Bool)
(declare-const credit_card_business_permitted Bool)
(declare-const credit_card_circulating_interest_rate_percent Real)
(declare-const credit_card_interest_rate_compliant Bool)
(declare-const field_collection_with_identification Bool)
(declare-const interest_and_fees_disclosed Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_ok Bool)
(declare-const internal_operation_system_established Bool)
(declare-const internal_operation_system_executed Bool)
(declare-const no_violent_or_harassing_collection Bool)
(declare-const penalty Bool)
(declare-const phone_collection_with_recording_and_data_retention Bool)
(declare-const proxy_signature_for_supplementary_card Bool)
(declare-const third_party_data_mandatory Bool)
(declare-const third_party_data_provision_compliant Bool)
(declare-const third_party_data_purpose_explained Bool)
(declare-const third_party_data_stop_request Bool)
(declare-const third_party_data_usage_stopped Bool)
(declare-const third_party_data_used_for_credit_or_collection Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [bank:internal_operation_established] 建立內部作業制度及程序
(assert (= internal_operation_established internal_operation_system_established))

; [bank:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [bank:internal_handling_executed] 內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_system_executed))

; [bank:internal_operation_executed] 內部作業制度及程序確實執行
(assert (= internal_operation_executed internal_operation_system_executed))

; [bank:internal_control_ok] 內部控制及稽核制度建立且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 內部處理制度及程序建立且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 內部作業制度及程序建立且確實執行
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [bank:credit_card_business_permitted] 經中央主管機關許可經營信用卡業務
(assert (= credit_card_business_permitted credit_card_business_license_granted))

; [bank:credit_card_interest_rate_compliant] 信用卡循環信用利率不超過年利率15%
(assert (= credit_card_interest_rate_compliant
   (>= 15.0 credit_card_circulating_interest_rate_percent)))

; [credit_card:applicant_statement_compliant] 申請書載明利率及費用等事項並經申請人確認
(assert (= applicant_statement_compliant
   (and interest_and_fees_disclosed applicant_confirmed)))

; [credit_card:applicant_signature_valid] 正卡申請人親自簽名，不得代理附卡申請人簽名
(assert (not (= proxy_signature_for_supplementary_card applicant_signature_valid)))

; [credit_card:third_party_data_provision_compliant] 第三人個人資料提供符合規定
(assert (= third_party_data_provision_compliant
   (and (not third_party_data_mandatory)
        third_party_data_purpose_explained
        (not third_party_data_used_for_credit_or_collection)
        (or (not third_party_data_stop_request) third_party_data_usage_stopped))))

; [credit_card:collection_practices_compliant] 催收行為符合誠實信用及相關規定
(assert (= collection_practices_compliant
   (and collection_not_violating_public_interest
        collection_only_to_cardholder_and_guarantor
        phone_collection_with_recording_and_data_retention
        no_violent_or_harassing_collection
        field_collection_with_identification)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未確實執行內部控制、內部處理、內部作業制度，或違反信用卡業務相關規定時處罰
(assert (= penalty
   (or (not internal_handling_ok)
       (not credit_card_business_permitted)
       (not credit_card_interest_rate_compliant)
       (not collection_practices_compliant)
       (not internal_control_ok)
       (not third_party_data_provision_compliant)
       (not applicant_statement_compliant)
       (not applicant_signature_valid)
       (not internal_operation_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_system_executed false))
(assert (= applicant_confirmed true))
(assert (= proxy_signature_for_supplementary_card false))
(assert (= interest_and_fees_disclosed true))
(assert (= third_party_data_mandatory false))
(assert (= third_party_data_purpose_explained true))
(assert (= third_party_data_used_for_credit_or_collection false))
(assert (= third_party_data_stop_request false))
(assert (= third_party_data_usage_stopped false))
(assert (= collection_not_violating_public_interest false))
(assert (= collection_only_to_cardholder_and_guarantor false))
(assert (= phone_collection_with_recording_and_data_retention true))
(assert (= no_violent_or_harassing_collection true))
(assert (= field_collection_with_identification true))
(assert (= credit_card_business_license_granted true))
(assert (= credit_card_circulating_interest_rate_percent 10.0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 37
; Total facts: 21
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
