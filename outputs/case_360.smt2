; SMT2 file generated from compliance case automatic
; Case ID: case_360
; Generated at: 2025-10-21T22:23:45.917097
;
; This file can be executed with Z3:
;   z3 case_360.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const derivative_experience_months Int)
(declare-const derivative_internship_years Int)
(declare-const derivative_license_held Bool)
(declare-const derivative_staff_qualified Bool)
(declare-const derivative_training_months Int)
(declare-const forex_derivative_branch_authorized Bool)
(declare-const forex_derivative_client_margin_trading Bool)
(declare-const forex_derivative_non_principal_ntd_forward Bool)
(declare-const forex_derivative_not_open_or_open_less_than_6_months Bool)
(declare-const forex_derivative_ntd_exchange_rate_related Bool)
(declare-const forex_derivative_offshore_info_consulting_approved Bool)
(declare-const forex_derivative_open_more_than_6_months_non_ntd Bool)
(declare-const forex_derivative_permit_required Bool)
(declare-const forex_derivative_post_open_report Bool)
(declare-const forex_derivative_pre_open_permit Bool)
(declare-const forex_derivative_pre_open_report Bool)
(declare-const forex_derivative_professional_or_high_net_worth_clients Bool)
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
(declare-const penalty Bool)
(declare-const structured_product_exam_passed Bool)
(declare-const structured_product_staff_qualified Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [bank:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [bank:internal_handling_executed] 內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_system_executed))

; [bank:internal_operation_established] 建立內部作業制度及程序
(assert (= internal_operation_established internal_operation_system_established))

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

; [bank:derivative_staff_qualified] 衍生性金融商品業務人員具備專業資格條件
(assert (= derivative_staff_qualified
   (or structured_product_exam_passed
       structured_product_staff_qualified
       (<= 1 derivative_internship_years)
       derivative_license_held
       (<= 3 derivative_training_months)
       (<= 6 derivative_experience_months))))

; [bank:derivative_structured_qualification] 結構型商品推介人員具備資格或通過資格測驗
(assert (= structured_product_staff_qualified
   (or (<= 1 derivative_internship_years)
       derivative_license_held
       (<= 3 derivative_training_months)
       (<= 6 derivative_experience_months))))

; [bank:forex_derivative_permit_required] 外匯衍生性商品業務需申請許可或函報備查
(assert (= forex_derivative_permit_required
   (or forex_derivative_pre_open_report
       forex_derivative_pre_open_permit
       forex_derivative_post_open_report)))

; [bank:forex_derivative_pre_open_permit] 外匯衍生性商品開辦前申請許可類
(assert (= forex_derivative_pre_open_permit
   (or forex_derivative_not_open_or_open_less_than_6_months
       forex_derivative_ntd_exchange_rate_related
       forex_derivative_client_margin_trading
       forex_derivative_non_principal_ntd_forward)))

; [bank:forex_derivative_pre_open_report] 外匯衍生性商品開辦前函報備查類
(assert (= forex_derivative_pre_open_report forex_derivative_branch_authorized))

; [bank:forex_derivative_post_open_report] 外匯衍生性商品開辦後函報備查類
(assert (= forex_derivative_post_open_report
   (or forex_derivative_offshore_info_consulting_approved
       forex_derivative_open_more_than_6_months_non_ntd
       forex_derivative_professional_or_high_net_worth_clients)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理、內部作業制度或違反外匯衍生性商品管理規定時處罰
(assert (= penalty
   (or (not internal_handling_ok)
       (not internal_operation_ok)
       (not forex_derivative_permit_required)
       (not internal_control_ok)
       (not derivative_staff_qualified))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_system_executed false))
(assert (= derivative_training_months 0))
(assert (= derivative_license_held false))
(assert (= derivative_internship_years 0))
(assert (= derivative_experience_months 0))
(assert (= structured_product_staff_qualified false))
(assert (= structured_product_exam_passed false))
(assert (= forex_derivative_not_open_or_open_less_than_6_months false))
(assert (= forex_derivative_non_principal_ntd_forward false))
(assert (= forex_derivative_ntd_exchange_rate_related false))
(assert (= forex_derivative_client_margin_trading false))
(assert (= forex_derivative_branch_authorized false))
(assert (= forex_derivative_open_more_than_6_months_non_ntd false))
(assert (= forex_derivative_professional_or_high_net_worth_clients false))
(assert (= forex_derivative_offshore_info_consulting_approved false))
(assert (= forex_derivative_pre_open_permit false))
(assert (= forex_derivative_pre_open_report false))
(assert (= forex_derivative_post_open_report false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 35
; Total facts: 23
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
