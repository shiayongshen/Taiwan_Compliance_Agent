; SMT2 file generated from compliance case automatic
; Case ID: case_207
; Generated at: 2025-10-19T10:29:23.480819
;
; This file can be executed with Z3:
;   z3 case_207.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const authorized_orders_complied Bool)
(declare-const backup_measures_taken_if_necessary Bool)
(declare-const bank_law_complied Bool)
(declare-const credit_data_service_permit_obtained Bool)
(declare-const credit_data_service_permit_required Bool)
(declare-const cross_bank_network_system_normal Bool)
(declare-const cross_bank_network_system_obstacle Bool)
(declare-const cross_bank_network_system_obstacle_handled Bool)
(declare-const cross_bank_network_system_operational Bool)
(declare-const cross_bank_network_system_stop_notification Bool)
(declare-const fund_transfer_service_permit_obtained Bool)
(declare-const fund_transfer_service_permit_required Bool)
(declare-const involves_large_fund_transfer Bool)
(declare-const justifiable_reason Bool)
(declare-const large_fund_transfer_permit_obtained Bool)
(declare-const large_fund_transfer_service_permit_required Bool)
(declare-const legal_compliance Bool)
(declare-const obstacle_eliminated_or_maintained Bool)
(declare-const penalty Bool)
(declare-const prior_notification_given Bool)
(declare-const stop_transmission_exchange_processing Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:fund_transfer_service_permit_required] 經營金融機構間資金移轉帳務清算之金融資訊服務事業須主管機關許可
(assert (= fund_transfer_service_permit_required fund_transfer_service_permit_obtained))

; [bank:large_fund_transfer_service_permit_required] 涉及大額資金移轉帳務清算業務須中央銀行許可
(assert (= large_fund_transfer_service_permit_required
   (or (not involves_large_fund_transfer) large_fund_transfer_permit_obtained)))

; [bank:credit_data_service_permit_required] 經營金融機構間徵信資料處理交換服務事業須主管機關許可
(assert (= credit_data_service_permit_required credit_data_service_permit_obtained))

; [bank:cross_bank_network_system_operational] 跨行金融資訊網路事業應維持跨行網路系統正常運作
(assert (= cross_bank_network_system_operational cross_bank_network_system_normal))

; [bank:cross_bank_network_system_obstacle_handled] 系統障礙應儘速排除及維護系統與相關設備，必要時採取備援措施
(assert (= cross_bank_network_system_obstacle_handled
   (or (not cross_bank_network_system_obstacle)
       (and obstacle_eliminated_or_maintained
            backup_measures_taken_if_necessary))))

; [bank:cross_bank_network_system_stop_notification] 系統障礙停止作業時，除有正當理由外應事先通知連線用戶及主管機關與中央銀行
(assert (let ((a!1 (or prior_notification_given
               (not (and cross_bank_network_system_obstacle
                         stop_transmission_exchange_processing
                         (not justifiable_reason))))))
  (= cross_bank_network_system_stop_notification a!1)))

; [bank:legal_compliance] 遵守銀行法及授權命令中強制、禁止及應為行為規定
(assert (= legal_compliance (and bank_law_complied authorized_orders_complied)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反銀行法或授權命令中強制、禁止或應為規定時處罰
(assert (not (= legal_compliance penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= fund_transfer_service_permit_obtained true))
(assert (= fund_transfer_service_permit_required true))
(assert (= involves_large_fund_transfer false))
(assert (= large_fund_transfer_permit_obtained false))
(assert (= large_fund_transfer_service_permit_required false))
(assert (= credit_data_service_permit_obtained false))
(assert (= credit_data_service_permit_required false))
(assert (= cross_bank_network_system_normal false))
(assert (= cross_bank_network_system_obstacle true))
(assert (= obstacle_eliminated_or_maintained true))
(assert (= backup_measures_taken_if_necessary true))
(assert (= stop_transmission_exchange_processing true))
(assert (= justifiable_reason false))
(assert (= prior_notification_given false))
(assert (= bank_law_complied false))
(assert (= authorized_orders_complied false))
(assert (= legal_compliance false))
(assert (= cross_bank_network_system_operational false))
(assert (= cross_bank_network_system_obstacle_handled true))
(assert (= cross_bank_network_system_stop_notification false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 21
; Total facts: 21
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
