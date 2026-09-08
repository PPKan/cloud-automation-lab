# Phase 5 — 把系統弄壞，然後證明你知道為什麼

前面的關卡都偏向「建立」。最後一關要反過來：故意把東西弄壞。

真實的 Cloud / DevOps / SRE / Security 工作很少是永遠按照 happy path 發展。真正花時間的部分往往是「為什麼這個昨天還能跑，今天突然不行」、「為什麼 Terraform plan 想改一堆我沒碰過的東西」、「為什麼 Managed Identity 明明存在卻拿不到 Key Vault」、「為什麼 network 看起來沒問題但 service 還是連不到」。

你之前提過，自己對「某個東西為什麼突然不能用」這類研究型問題比較有興趣。這一關就是刻意把這種工作型態做成一個 lab。

## 情境

你的 Azure environment 已經由 Terraform 建立，identity 與 RBAC 也設定完成，Git / pipeline 可以協助管理變更。現在請假設你是 on-call engineer，收到一句很簡單的問題：

「系統壞了。」

你不知道答案，但你的目標非常清楚：找出 root cause，證明自己的判斷，修復它，並提出一個可以避免下次再發生的方式。

## 你的任務

請自行設計至少三個故障情境。可以從以下類型挑選，但最好至少跨兩個不同領域：

- Network：NSG、Subnet、route 或其他 network configuration 造成 connectivity 問題。
- Identity / Authorization：RBAC 不足、Managed Identity 設定錯誤、Key Vault access 被拒絕。
- IaC：Terraform configuration、dependency、state 或 drift 導致預期外的變更。
- Pipeline：credential、permission、environment variable 或 pipeline configuration 造成 deployment failure。
- Observability：你知道系統有問題，但一開始沒有足夠資訊判斷原因，因此需要研究 Azure Monitor、Activity Log、Log Analytics 或其他可觀測性來源。

每一個故障都不要直接寫「問題是 NSG 設錯」。請按照 investigation 的方式處理：先記錄症狀與預期行為，再列出幾個 plausible hypotheses，接著設計方法排除，最後才確認 root cause。

如果可能，至少有一個 case 請你一開始不要預先知道答案。例如在幾天後回來重新 debug，或先隨機修改一個設定再忘掉細節，讓 investigation 更接近真實情境。

## 你的故障報告

每個 case 最後請整理成一篇短 write-up，結構至少包含：

- Symptom：實際觀察到什麼。
- Expected Behavior：原本應該發生什麼。
- Hypotheses：你最初想到哪些可能原因。
- Investigation：你查了哪些資訊、做了哪些測試。
- Root Cause：真正原因是什麼。
- Fix：你最後如何修復。
- Prevention：如果這是 production，你會怎麼降低它再次發生的機率。

你可以使用 Azure Monitor、Activity Log、Log Analytics 等工具協助調查，但這一關不要求完整 SIEM，也不要求學 Sentinel。重點是學會用證據縮小問題空間，而不是收集越多工具越好。

## 完成條件

當你完成至少三個故障案例，而且至少有一個案例讓你真正經歷「原本猜錯 → 找證據 → 修正 hypothesis → 找到 root cause」的過程，就可以結束 Phase 5。

完成後，請不要馬上開下一個技術坑。先回頭看整個 Phase 0～5。

## 最後的職涯回顧

請用一頁以內回答下面幾個問題：

- 我最喜歡的是理解 Azure architecture、寫 Terraform、設計 identity / RBAC、做 pipeline，還是 troubleshooting？
- 哪一關我會不知不覺做超過原本預定時間？
- 哪一關我一直想趕快做完？
- 我最有興趣的是「建立系統」、「自動化系統」、「保護系統」，還是「找出系統為什麼壞掉」？
- 如果這些事情每天要做三到四小時，我最願意選哪一種？
- 我下一輪看 104 JD 時，Cloud Engineer、DevOps、Platform、SRE、Cloud Security 哪個職稱開始最有感？

Project B 到這裡就正式結束。後面要不要進 Kubernetes、remote state、Terraform module、Sentinel、Azure Policy、Container Security 或其他技術，應該由這份回顧決定，而不是因為 roadmap 上還有下一個東西可以學。
