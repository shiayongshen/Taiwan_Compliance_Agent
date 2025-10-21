; SMT2 file generated from compliance case automatic
; Case ID: case_45
; Generated at: 2025-10-21T00:00:49.644085
;
; This file can be executed with Z3:
;   z3 case_45.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accept_client_without_proper_contract Bool)
(declare-const accept_full_power_of_attorney Bool)
(declare-const accept_non_owner_account_opening Bool)
(declare-const accept_orders_with_market_manipulation_intent Bool)
(declare-const accept_unauthorized_agent_trading Bool)
(declare-const all_prohibited_behaviors_ok Bool)
(declare-const company_officer_or_employee_agent_trading Bool)
(declare-const correction_order_issued Bool)
(declare-const director_violation Bool)
(declare-const employee_violation Bool)
(declare-const failure_to_submit_or_obstruct_inspection Bool)
(declare-const fraud_or_concealment_in_underwriting_or_trading Bool)
(declare-const honesty_and_credit_followed Bool)
(declare-const honesty_and_credit_principle Bool)
(declare-const illegal_disclosure_of_client_info Bool)
(declare-const improper_bookkeeping_or_reporting Bool)
(declare-const induce_trading_by_price_prediction Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_control_system_updated_within_deadline Bool)
(declare-const internal_control_updated Bool)
(declare-const joint_risk_sharing_with_client Bool)
(declare-const loan_or_mediation_with_client Bool)
(declare-const misappropriation_or_custody_violation Bool)
(declare-const non_compliance_found Bool)
(declare-const not_follow_client_instructions Bool)
(declare-const offsetting_trades_not_allowed Bool)
(declare-const other_prohibited_acts Bool)
(declare-const penalty Bool)
(declare-const penalty_level Int)
(declare-const penalty_level_dismissal Int)
(declare-const penalty_level_other Int)
(declare-const penalty_level_revocation Int)
(declare-const penalty_level_suspension Int)
(declare-const penalty_level_warning Int)
(declare-const profit_guarantee_or_sharing Bool)
(declare-const prohibited_behavior_1 Bool)
(declare-const prohibited_behavior_10 Bool)
(declare-const prohibited_behavior_11 Bool)
(declare-const prohibited_behavior_12 Bool)
(declare-const prohibited_behavior_13 Bool)
(declare-const prohibited_behavior_14 Bool)
(declare-const prohibited_behavior_15 Bool)
(declare-const prohibited_behavior_16 Bool)
(declare-const prohibited_behavior_17 Bool)
(declare-const prohibited_behavior_18 Bool)
(declare-const prohibited_behavior_19 Bool)
(declare-const prohibited_behavior_2 Bool)
(declare-const prohibited_behavior_20 Bool)
(declare-const prohibited_behavior_21 Bool)
(declare-const prohibited_behavior_22 Bool)
(declare-const prohibited_behavior_23 Bool)
(declare-const prohibited_behavior_24 Bool)
(declare-const prohibited_behavior_3 Bool)
(declare-const prohibited_behavior_4 Bool)
(declare-const prohibited_behavior_5 Bool)
(declare-const prohibited_behavior_6 Bool)
(declare-const prohibited_behavior_7 Bool)
(declare-const prohibited_behavior_8 Bool)
(declare-const prohibited_behavior_9 Bool)
(declare-const promote_unapproved_securities_or_derivatives Bool)
(declare-const promote_unapproved_stocks Bool)
(declare-const self_dealing_in_client_orders Bool)
(declare-const speculative_trading_using_insider_info Bool)
(declare-const supervisor_violation Bool)
(declare-const unauthorized_agent_account_opening_or_trading Bool)
(declare-const underwriter_improper_benefit_agreement Bool)
(declare-const use_client_account_for_trading Bool)
(declare-const use_others_or_relatives_name_for_client_trading Bool)
(declare-const violation_178_1_1 Bool)
(declare-const violation_178_1_2 Bool)
(declare-const violation_178_1_3 Bool)
(declare-const violation_178_1_4 Bool)
(declare-const violation_178_1_5 Bool)
(declare-const violation_178_1_6 Bool)
(declare-const violation_178_1_7 Bool)
(declare-const violation_178_1_any Bool)
(declare-const violation_178_1_improved Bool)
(declare-const violation_178_1_improvement_completed Bool)
(declare-const violation_178_1_minor Bool)
(declare-const violation_178_1_minor_flag Bool)
(declare-const violation_affecting_business Bool)
(declare-const violation_affecting_business_alt Bool)
(declare-const violation_affecting_business_alt2 Bool)
(declare-const violation_affecting_business_any Bool)
(declare-const violation_affects_business Bool)
(declare-const violation_and_penalty Bool)
(declare-const violation_financial_business_management_rules Bool)
(declare-const violation_issuance_and_management_rules Bool)
(declare-const violation_of_law_or_order Bool)
(declare-const violation_related_institutions_rules Bool)
(declare-const violation_specified_articles Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_affecting_business] 董事、監察人及受僱人違反法令且影響業務正常執行
(assert (= violation_affecting_business
   (and director_violation violation_affects_business)))

; [securities:violation_affecting_business_alt] 董事、監察人及受僱人違反法令且影響業務正常執行（監察人或受僱人）
(assert (= violation_affecting_business_alt
   (and supervisor_violation violation_affects_business)))

; [securities:violation_affecting_business_alt2] 董事、監察人及受僱人違反法令且影響業務正常執行（受僱人）
(assert (= violation_affecting_business_alt2
   (and employee_violation violation_affects_business)))

; [securities:violation_affecting_business_any] 董事、監察人或受僱人違反法令且影響業務正常執行
(assert (= violation_affecting_business_any
   (or violation_affecting_business
       violation_affecting_business_alt
       violation_affecting_business_alt2)))

; [securities:correction_order_issued] 主管機關發現不符合規定事項並命令糾正或限期改善
(assert (= correction_order_issued non_compliance_found))

; [securities:violation_and_penalty] 證券商違反法令或命令
(assert (= violation_and_penalty violation_of_law_or_order))

; [securities:penalty_level] 主管機關依情節輕重對證券商處分等級（1=警告,2=解除職務,3=停業,4=撤銷營業許可,5=其他處置）
(assert (let ((a!1 (ite (= penalty_level_suspension 1)
                3
                (ite (= penalty_level_revocation 1)
                     4
                     (ite (= penalty_level_other 1) 5 0)))))
  (= penalty_level
     (ite (= penalty_level_warning 1)
          1
          (ite (= penalty_level_dismissal 1) 2 a!1)))))

; [securities:violation_178_1_1] 違反證券交易法指定條文之一
(assert (= violation_178_1_1 violation_specified_articles))

; [securities:violation_178_1_2] 未依主管機關命令提出帳簿文件或妨礙檢查
(assert (= violation_178_1_2 failure_to_submit_or_obstruct_inspection))

; [securities:violation_178_1_3] 未依規定製作、申報、公告、備置或保存帳簿文件
(assert (= violation_178_1_3 improper_bookkeeping_or_reporting))

; [securities:violation_178_1_4] 未確實執行內部控制制度
(assert (not (= internal_control_executed violation_178_1_4)))

; [securities:violation_178_1_5] 違反財務、業務或管理規定
(assert (= violation_178_1_5 violation_financial_business_management_rules))

; [securities:violation_178_1_6] 違反有關發行、標準、規則、辦法之財務、業務或管理規定
(assert (= violation_178_1_6 violation_issuance_and_management_rules))

; [securities:violation_178_1_7] 違反證券櫃檯買賣中心、同業公會或證券交易所相關規定
(assert (= violation_178_1_7 violation_related_institutions_rules))

; [securities:violation_178_1_any] 違反第178-1條任一規定
(assert (= violation_178_1_any
   (or violation_178_1_1
       violation_178_1_2
       violation_178_1_3
       violation_178_1_4
       violation_178_1_5
       violation_178_1_6
       violation_178_1_7)))

; [securities:violation_178_1_minor] 違反第178-1條情節輕微
(assert (= violation_178_1_minor violation_178_1_minor_flag))

; [securities:violation_178_1_improved] 違反第178-1條已限期改善且完成
(assert (= violation_178_1_improved violation_178_1_improvement_completed))

; [securities:internal_control_established] 證券商依規定訂定內部控制制度
(assert (= internal_control_established internal_control_system_established))

; [securities:internal_control_executed] 證券商確實執行內部控制制度
(assert (= internal_control_executed internal_control_system_executed))

; [securities:internal_control_updated] 內部控制制度依通知限期內變更
(assert (= internal_control_updated internal_control_system_updated_within_deadline))

; [securities:honesty_and_credit_principle] 負責人及業務人員執行業務應本誠實及信用原則
(assert (= honesty_and_credit_principle honesty_and_credit_followed))

; [securities:prohibited_behavior_1] 禁止利用職務消息從事投機買賣
(assert (not (= speculative_trading_using_insider_info prohibited_behavior_1)))

; [securities:prohibited_behavior_2] 禁止非依法令查詢洩漏客戶秘密
(assert (not (= illegal_disclosure_of_client_info prohibited_behavior_2)))

; [securities:prohibited_behavior_3] 禁止受理客戶全權委託
(assert (not (= accept_full_power_of_attorney prohibited_behavior_3)))

; [securities:prohibited_behavior_4] 禁止對客戶作贏利保證或分享利益
(assert (not (= profit_guarantee_or_sharing prohibited_behavior_4)))

; [securities:prohibited_behavior_5] 禁止約定與客戶共同承擔交易損益
(assert (not (= joint_risk_sharing_with_client prohibited_behavior_5)))

; [securities:prohibited_behavior_6] 禁止以自己計算為買入或賣出相對行為
(assert (not (= self_dealing_in_client_orders prohibited_behavior_6)))

; [securities:prohibited_behavior_7] 禁止利用客戶名義或帳戶申購買賣有價證券
(assert (not (= use_client_account_for_trading prohibited_behavior_7)))

; [securities:prohibited_behavior_8] 禁止以他人或親屬名義供客戶申購買賣有價證券
(assert (not (= use_others_or_relatives_name_for_client_trading prohibited_behavior_8)))

; [securities:prohibited_behavior_9] 禁止與客戶有借貸款項或媒介情事
(assert (not (= loan_or_mediation_with_client prohibited_behavior_9)))

; [securities:prohibited_behavior_10] 禁止承銷或買賣有價證券時有隱瞞詐欺行為
(assert (not (= fraud_or_concealment_in_underwriting_or_trading prohibited_behavior_10)))

; [securities:prohibited_behavior_11] 禁止挪用或代客戶保管有價證券、款項、印鑑或存摺
(assert (not (= misappropriation_or_custody_violation prohibited_behavior_11)))

; [securities:prohibited_behavior_12] 禁止受理未辦妥受託契約之客戶買賣有價證券
(assert (not (= accept_client_without_proper_contract prohibited_behavior_12)))

; [securities:prohibited_behavior_13] 禁止未依客戶委託事項及條件執行買賣
(assert (not (= not_follow_client_instructions prohibited_behavior_13)))

; [securities:prohibited_behavior_14] 禁止向客戶或不特定多數人提供證券漲跌判斷以勸誘買賣
(assert (not (= induce_trading_by_price_prediction prohibited_behavior_14)))

; [securities:prohibited_behavior_15] 禁止向不特定多數人推介未經核准之股票（承銷例外）
(assert (not (= promote_unapproved_stocks prohibited_behavior_15)))

; [securities:prohibited_behavior_16] 禁止接受客戶以同一或不同帳戶為同種有價證券買賣相抵（法令例外除外）
(assert (not (= offsetting_trades_not_allowed prohibited_behavior_16)))

; [securities:prohibited_behavior_17] 禁止代理他人開戶、申購、買賣或交割有價證券（法定代理人除外）
(assert (not (= unauthorized_agent_account_opening_or_trading prohibited_behavior_17)))

; [securities:prohibited_behavior_18] 禁止受理本公司董事、監察人、受僱人代理他人開戶、申購、買賣或交割有價證券
(assert (not (= company_officer_or_employee_agent_trading prohibited_behavior_18)))

; [securities:prohibited_behavior_19] 禁止受理非本人開戶（本會另有規定除外）
(assert (not (= accept_non_owner_account_opening prohibited_behavior_19)))

; [securities:prohibited_behavior_20] 禁止受理非本人或未具委任書代理人申購、買賣或交割有價證券（特定例外除外）
(assert (not (= accept_unauthorized_agent_trading prohibited_behavior_20)))

; [securities:prohibited_behavior_21] 禁止知悉客戶有操縱市場意圖仍接受委託買賣
(assert (not (= accept_orders_with_market_manipulation_intent prohibited_behavior_21)))

; [securities:prohibited_behavior_22] 禁止承銷人員與發行公司或相關人員有不當利益約定
(assert (not (= underwriter_improper_benefit_agreement prohibited_behavior_22)))

; [securities:prohibited_behavior_23] 禁止招攬、媒介、促銷未經核准有價證券或衍生性商品
(assert (not (= promote_unapproved_securities_or_derivatives prohibited_behavior_23)))

; [securities:prohibited_behavior_24] 禁止其他違反證券管理法令或本會規定不得為之行為
(assert (not (= other_prohibited_acts prohibited_behavior_24)))

; [securities:all_prohibited_behaviors_ok] 所有禁止行為均未違反
(assert (= all_prohibited_behaviors_ok
   (and prohibited_behavior_1
        prohibited_behavior_2
        prohibited_behavior_3
        prohibited_behavior_4
        prohibited_behavior_5
        prohibited_behavior_6
        prohibited_behavior_7
        prohibited_behavior_8
        prohibited_behavior_9
        prohibited_behavior_10
        prohibited_behavior_11
        prohibited_behavior_12
        prohibited_behavior_13
        prohibited_behavior_14
        prohibited_behavior_15
        prohibited_behavior_16
        prohibited_behavior_17
        prohibited_behavior_18
        prohibited_behavior_19
        prohibited_behavior_20
        prohibited_behavior_21
        prohibited_behavior_22
        prohibited_behavior_23
        prohibited_behavior_24)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一證券交易法第178-1條規定且非輕微或未改善，或董事監察人受僱人違反法令影響業務，或違反禁止行為
(assert (= penalty
   (or (not all_prohibited_behaviors_ok)
       violation_affecting_business_any
       (and violation_178_1_any
            (not violation_178_1_minor)
            (not violation_178_1_improved)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= director_violation true))
(assert (= supervisor_violation false))
(assert (= employee_violation true))
(assert (= violation_affects_business true))
(assert (= violation_affecting_business true))
(assert (= violation_affecting_business_alt false))
(assert (= violation_affecting_business_alt2 true))
(assert (= violation_affecting_business_any true))
(assert (= non_compliance_found true))
(assert (= correction_order_issued true))
(assert (= violation_of_law_or_order true))
(assert (= violation_specified_articles true))
(assert (= violation_178_1_1 true))
(assert (= violation_178_1_2 false))
(assert (= violation_178_1_3 false))
(assert (= violation_178_1_4 true))
(assert (= violation_178_1_5 true))
(assert (= violation_178_1_6 false))
(assert (= violation_178_1_7 false))
(assert (= violation_178_1_any true))
(assert (= violation_178_1_minor false))
(assert (= violation_178_1_improved false))
(assert (= violation_178_1_improvement_completed false))
(assert (= internal_control_system_established true))
(assert (= internal_control_system_executed false))
(assert (= internal_control_established true))
(assert (= internal_control_executed false))
(assert (= internal_control_updated false))
(assert (= internal_control_system_updated_within_deadline false))
(assert (= honesty_and_credit_followed false))
(assert (= honesty_and_credit_principle false))
(assert (= prohibited_behavior_1 true))
(assert (= prohibited_behavior_2 true))
(assert (= prohibited_behavior_3 true))
(assert (= prohibited_behavior_4 true))
(assert (= prohibited_behavior_5 true))
(assert (= prohibited_behavior_6 true))
(assert (= prohibited_behavior_7 true))
(assert (= prohibited_behavior_8 true))
(assert (= prohibited_behavior_9 true))
(assert (= prohibited_behavior_10 true))
(assert (= prohibited_behavior_11 true))
(assert (= prohibited_behavior_12 true))
(assert (= prohibited_behavior_13 true))
(assert (= prohibited_behavior_14 true))
(assert (= prohibited_behavior_15 true))
(assert (= prohibited_behavior_16 true))
(assert (= prohibited_behavior_17 true))
(assert (= prohibited_behavior_18 true))
(assert (= prohibited_behavior_19 true))
(assert (= prohibited_behavior_20 true))
(assert (= prohibited_behavior_21 true))
(assert (= prohibited_behavior_22 true))
(assert (= prohibited_behavior_23 true))
(assert (= prohibited_behavior_24 true))
(assert (= all_prohibited_behaviors_ok false))
(assert (= penalty_level_warning false))
(assert (= penalty_level_dismissal false))
(assert (= penalty_level_suspension true))
(assert (= penalty_level_revocation false))
(assert (= penalty_level_other false))
(assert (= penalty_level 3))
(assert (= penalty true))
(assert (= violation_and_penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 48
; Total variables: 94
; Total facts: 64
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)
