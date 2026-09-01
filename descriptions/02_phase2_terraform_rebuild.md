# Phase 2 — 把手動環境變成可重建的 Infrastructure as Code

你已經親手建立過一次 Azure 環境。現在請把 Phase 1 的成果視為不存在，重新開始；但這一次，不要用 Azure Portal 一個個建立資源，而是用 Terraform 描述你希望雲端最後呈現的狀態。

這一關是整個專案最重要的轉折。前一關你是在「操作 Azure」，這一關開始，你要思考的是「怎麼描述 Azure」。你不再把注意力放在滑鼠要去哪裡，而是開始思考 resource 之間的 dependency、configuration 如何被拆開、哪些值應該成為 variable，以及 Terraform 如何知道雲端現在已經存在什麼。

## 你的任務

請用 Terraform 重新建立 Phase 1 的基本環境。第一版至少應包含：

- Resource Group。
- Virtual Network。
- Subnet。
- Network Security Group。
- Key Vault。
- 你在 Phase 1 使用到的基本 RBAC / identity configuration，只做到你目前理解範圍即可。

在這個過程中，你需要自己閱讀 Terraform 與 Azure provider 的官方文件，理解 provider、resource、data source、reference、variable、output、state、plan 與 apply 等概念。不要追求「Terraform 最佳架構」；先確保你真的理解自己寫下的每一個 block 是為了什麼。

這一關請至少經歷一次完整 lifecycle：從空環境開始，執行 plan，確認變更，再 apply；接著修改某個設定，重新 plan 並觀察 Terraform 如何描述差異；最後 destroy 整套環境，再重新 apply 一次，確認它能夠重建。

## 你要特別思考的問題

這一關的核心不是 syntax，而是以下幾個問題：

- Declarative configuration 和你以前寫 Excel 手順書的思考方式有什麼不同？
- Terraform 為什麼需要 state？
- 如果你手動去 Portal 修改 Terraform 管理的 resource，會發生什麼？
- Terraform plan 到底替工程師解決什麼風險？
- 哪些 resource 有 dependency？Terraform 怎麼知道建立順序？
- 哪些值值得抽成 variable？哪些不值得？
- destroy 之後能夠重新建立，對團隊而言有什麼意義？

## 建議留下的成果

你的 repository 不需要複雜，但至少應該有清楚的 Terraform configuration、README，以及一張架構圖。README 不要寫成安裝教學，而是解釋「這套環境是什麼、為什麼這樣設計、如何由 Terraform 管理」。

另外請記錄一個你真正遇到的錯誤。不要只貼 error message，而是寫下你當時原本以為發生什麼、最後怎麼發現真正原因。

## 完成條件

當你可以從一個乾淨的 Azure 環境開始，只依靠自己的 Terraform configuration 重建 Phase 1 的主要資源，並且能夠 destroy 後再次成功 recreate，就可以結束 Phase 2。

你不需要 module、不需要 remote state、不需要 Kubernetes，也不需要複雜 CI/CD。即使你知道那些東西存在，也先不要開新的坑。

## 這一關真正要觀察的事情

請問自己：把人工操作變成 declarative configuration 的過程有沒有讓你覺得舒服？你會不會自然想把重複的設定抽象化、parameterize，或希望少做一次手動操作？如果這種衝動很強，Cloud Automation / DevOps / Platform Engineering 可能真的值得繼續探索。如果 Terraform 對你而言只是另一種更麻煩的手順書，也把這個答案記下來。
