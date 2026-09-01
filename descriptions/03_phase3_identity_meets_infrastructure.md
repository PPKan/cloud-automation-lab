# Phase 3 — 把你原本的 Identity 經驗接進 Azure Infrastructure

到這裡，你已經知道如何用 Terraform 建立基本 Azure Infrastructure。下一關要把你最熟悉的世界重新接回來：Identity。

你之前做過 Entra Conditional Access 與 Intune，主要思考的是「一個使用者在什麼條件下可以登入或使用資源」。進入 Azure Infrastructure 後，問題會開始變成「這個人或這個 workload 可以對哪個 Azure resource 做什麼」。這一關要讓你第一次真正把 Authentication、Authorization、Human Identity 與 Workload Identity 放進同一張圖裡。

## 情境

假設你的團隊有一個應用服務，需要讀取 Key Vault 中的 secret。團隊不希望把帳號密碼、client secret 或其他 credential 寫死在程式碼或 Terraform configuration 裡，也不希望所有工程師都擁有整個 subscription 的管理權限。

你的任務不是單純「讓它能動」，而是設計一個比較合理的 identity / authorization model。

## 你的任務

請在 Phase 2 的環境上加入一個具體的 Identity 與 RBAC 情境。你可以自行決定實際使用哪些 Azure resource，但必須包含以下概念：

- 至少一個 human identity 或 group，並且有明確的 RBAC role。
- 至少一個 workload / service identity 的情境，建議研究 Managed Identity。
- 一個需要被保護的 resource，例如 Key Vault。
- 明確區分哪些 identity 可以 read、哪些可以 manage，以及哪些根本不應該有 access。
- 如果技術上適合，盡可能讓這些 authorization 設定也由 Terraform 管理。

這一關不要求你把 Entra Conditional Access 直接 Terraform 化，也不要求你把 Intune 加進來。你真正要理解的是：你以前熟悉的「登入政策」只是 identity security 的其中一層，Azure Resource Authorization 是另一層。

## 你要回答的問題

完成實作後，請用自己的話回答：

- Conditional Access 和 Azure RBAC 解決的是不是同一個問題？
- Authentication 成功之後，為什麼仍然需要 Authorization？
- User identity 和 Managed Identity 的差別是什麼？
- 為什麼 workload identity 比直接存一組長期 credential 更合理？
- Least privilege 在你這個 lab 裡具體是什麼意思？
- 如果某個 identity 的權限給太大，攻擊者取得它之後可能造成什麼影響？
- 你以前做 Entra / CA 的經驗，哪些部分能幫助你理解這一關？哪些部分完全是新世界？

## 建議留下的成果

更新你的 architecture diagram，讓 identity、role assignment、resource access 都能被看懂。再寫一篇短文，不要只說「我設定了 Managed Identity」，而是完整說明你想解決的 security problem，以及為什麼最後採用這種設計。

## 完成條件

當你可以清楚畫出「Identity → Authentication → Authorization → Resource」的關係，而且你的 lab 裡確實存在一個受到 RBAC / workload identity 控制的 resource access flow，就可以結束 Phase 3。

## 這一關真正要觀察的事情

這一關對你的職涯探索特別重要。請觀察自己真正感興趣的是 Terraform 本身、Cloud Infrastructure，還是 Identity / Permission Design。如果你做到 RBAC、Managed Identity、Key Vault 時明顯比 VNet / Subnet 更有精神，那 Identity Security / Cloud Security 可能比純 DevOps 更適合你。如果你反而最享受把這些設定全部變成 code，那 Automation / Platform 的訊號會更強。
