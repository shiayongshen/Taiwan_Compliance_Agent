; SMT2 file generated from compliance case automatic
; Case ID: case_207
; Generated at: 2025-10-21T04:33:09.381528
;
; This file can be executed with Z3:
;   z3 case_207.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const authority_notified Bool)
(declare-const backup_measures_taken_if_needed Bool)
(declare-const business_includes_automation_consulting Bool)
(declare-const business_includes_disaster_backup Bool)
(declare-const business_includes_fund_clearing Bool)
(declare-const business_includes_info_transmission Bool)
(declare-const business_includes_other_approved Bool)
(declare-const business_scope_valid Bool)
(declare-const central_bank_license_obtained Bool)
(declare-const central_bank_notified Bool)
(declare-const complies_with_authorized_orders Bool)
(declare-const complies_with_bank_law Bool)
(declare-const credit_data_service_license_obtained Bool)
(declare-const credit_data_service_permitted Bool)
(declare-const cross_bank_network_obstacle_handled Bool)
(declare-const cross_bank_network_obstacle_notification Bool)
(declare-const cross_bank_network_operational Bool)
(declare-const fund_transfer_service_license_obtained Bool)
(declare-const fund_transfer_service_permitted Bool)
(declare-const involves_large_amount_fund_transfer Bool)
(declare-const justified_reason Bool)
(declare-const large_amount_fund_transfer_permitted Bool)
(declare-const legal_compliance Bool)
(declare-const network_system_operational Bool)
(declare-const obstacle_causes_stop Bool)
(declare-const obstacle_detected Bool)
(declare-const obstacle_resolved_quickly Bool)
(declare-const penalty Bool)
(declare-const system_and_equipment_maintained Bool)
(declare-const user_notified Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:fund_transfer_service_permitted] 經營金融機構間資金移轉帳務清算之金融資訊服務事業須經主管機關許可
(assert (= fund_transfer_service_permitted fund_transfer_service_license_obtained))

; [bank:large_amount_fund_transfer_permitted] 涉及大額資金移轉帳務清算業務須經中央銀行許可
(assert (= large_amount_fund_transfer_permitted
   (or (not involves_large_amount_fund_transfer) central_bank_license_obtained)))

; [bank:credit_data_service_permitted] 經營金融機構間徵信資料處理交換之服務事業須經主管機關許可
(assert (= credit_data_service_permitted credit_data_service_license_obtained))

; [bank:cross_bank_network_operational] 跨行金融資訊網路事業應維持跨行網路系統正常運作
(assert (= cross_bank_network_operational network_system_operational))

; [bank:cross_bank_network_obstacle_handled] 系統障礙應儘速排除及維護系統與相關設備，必要時採取備援措施
(assert (= cross_bank_network_obstacle_handled
   (and obstacle_detected
        obstacle_resolved_quickly
        system_and_equipment_maintained
        backup_measures_taken_if_needed)))

; [bank:cross_bank_network_obstacle_notification] 因系統障礙需停止作業時，除有正當理由外應事先通知連線用戶及主管機關與中央銀行
(assert (let ((a!1 (or (not (and obstacle_causes_stop (not justified_reason)))
               (and user_notified authority_notified central_bank_notified))))
  (= cross_bank_network_obstacle_notification a!1)))

; [bank:business_scope_valid] 跨行金融資訊網路事業經營業務範圍符合規定
(assert (= business_scope_valid
   (and business_includes_fund_clearing
        business_includes_info_transmission
        business_includes_disaster_backup
        business_includes_automation_consulting
        business_includes_other_approved)))

; [bank:legal_compliance] 遵守銀行法及授權命令中強制、禁止及應為行為規定
(assert (= legal_compliance
   (and complies_with_bank_law complies_with_authorized_orders)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反許可規定、系統維護義務或法律強制禁止規定時處罰
(assert (= penalty
   (or (and obstacle_causes_stop
            (not justified_reason)
            (not cross_bank_network_obstacle_notification))
       (not legal_compliance)
       (not fund_transfer_service_permitted)
       (not cross_bank_network_operational)
       (not business_scope_valid)
       (not cross_bank_network_obstacle_handled)
       (not credit_data_service_permitted)
       (and involves_large_amount_fund_transfer
            (not large_amount_fund_transfer_permitted)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= fund_transfer_service_license_obtained true))
(assert (= fund_transfer_service_permitted true))
(assert (= involves_large_amount_fund_transfer false))
(assert (= large_amount_fund_transfer_permitted true))
(assert (= credit_data_service_license_obtained true))
(assert (= credit_data_service_permitted true))
(assert (= network_system_operational false))
(assert (= cross_bank_network_operational false))
(assert (= obstacle_detected true))
(assert (= obstacle_causes_stop true))
(assert (= justified_reason false))
(assert (= obstacle_resolved_quickly false))
(assert (= system_and_equipment_maintained true))
(assert (= backup_measures_taken_if_needed true))
(assert (= cross_bank_network_obstacle_handled false))
(assert (= user_notified false))
(assert (= authority_notified false))
(assert (= central_bank_notified false))
(assert (= cross_bank_network_obstacle_notification false))
(assert (= business_includes_fund_clearing true))
(assert (= business_includes_info_transmission true))
(assert (= business_includes_disaster_backup true))
(assert (= business_includes_automation_consulting true))
(assert (= business_includes_other_approved true))
(assert (= business_scope_valid true))
(assert (= complies_with_bank_law false))
(assert (= complies_with_authorized_orders false))
(assert (= legal_compliance false))
(assert (= penalty true))
(assert (= central_bank_license_obtained true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 30
; Total facts: 30
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
